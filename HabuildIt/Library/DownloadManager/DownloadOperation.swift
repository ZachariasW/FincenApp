//
//  DownloadOperation.swift
//  HabuildIt
//
//  Created by Vivek Singh on 07/12/23.
//

import Foundation

class DownloadOperation: AsynchronousOperation {
    public var task: URLSessionTask!
    private let saveDirectory: URL

    init(session: URLSession, url: URL, mainFolder: String, subFolder: String) {
        // Construct the full save directory path
        let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        self.saveDirectory = documentsURL
            .appendingPathComponent(mainFolder) // Main folder
            .appendingPathComponent(subFolder) // Subfolder
        
        task = session.downloadTask(with: url)
        super.init()
    }

    override func cancel() {
        task.cancel()
        super.cancel()
    }

    override func main() {
        task.resume()
    }
}

// MARK: Track the download progress from Download manager's urlsession

extension DownloadOperation {
    
    /// Download complete. Save file to the specified directory.
    func trackDownloadByOperation(_ session: URLSession, downloadTask: URLSessionDownloadTask, didFinishDownloadingTo location: URL) {
        do {
            let manager = FileManager.default
            
            // Ensure the full directory path exists
            if !manager.fileExists(atPath: saveDirectory.path) {
                try manager.createDirectory(at: saveDirectory, withIntermediateDirectories: true, attributes: nil)
            }
            
            // Construct the destination URL with the filename
            let destinationURL = saveDirectory.appendingPathComponent(downloadTask.originalRequest!.url!.lastPathComponent)
            
            // Remove existing file if it exists
            if manager.fileExists(atPath: destinationURL.path) {
                try manager.removeItem(at: destinationURL)
            }
            
            // Move the file from the temp location to the destination
            try manager.moveItem(at: location, to: destinationURL)
            print("File saved to: \(destinationURL.path)")
        } catch {
            print("Error saving file: \(error)")
        }
        
        completeOperation()
    }

    /// Downloading progress.
    func trackDownloadByOperation(_ session: URLSession, downloadTask: URLSessionDownloadTask, didWriteData bytesWritten: Int64, totalBytesWritten: Int64, totalBytesExpectedToWrite: Int64) {
        // You can handle progress updates here if needed
    }
    
    /// Download failed.
    func trackDownloadByOperation(_ session: URLSession, task: URLSessionTask, didCompleteWithError error: Error?) {
        if let error = error {
            print("Download failed with error: \(error)")
        }
        completeOperation()
    }
}

