//
//  ViewController.swift
//  UVLib-example
//
//  Created by Raees Kattali on 20/11/2022.
//

import UIKit
import UVLib

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        startUvlibTCPEchoServer()
        testTCPEchoServer()
    }

    func startUvlibTCPEchoServer() {
        
        let tcpHost = "127.0.0.1"
        let tcpPort: Int32 = 7050
        
        let queue = OperationQueue()
        queue.qualityOfService = .background
        queue.name = "com.uvlib.tcpEchoServerQueue"
        
        queue.addOperation {
            //Starting libuv TCP echo server
            uv_start_echo_server(tcpHost, tcpPort)
        }
    }
    
    func testTCPEchoServer(){
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
            let tcpHost = "127.0.0.1"
            let tcpPort: Int = 7050
            //Sending a TCP socket message to the TCP ECHO Server
            let task = URLSession.shared.streamTask(withHostName: tcpHost, port: tcpPort)
            task.resume()
            
            if let data = "hello".data(using: .utf8) {
                task.write(data, timeout: 10) { error in
                    if let e = error {
                        print(e.localizedDescription)
                    }
                }
            }
            // Packet sent
            
            
            //Reading data from TCP server (which should be the same data we send above)
            task.readData(ofMinLength: 0, maxLength: 1024, timeout: 10) { data, atEOF, error in
                
                if let e = error {
                    print(e.localizedDescription)
                }
                else
                {
                    if let d = data, let strData = String(data: d, encoding: .utf8) {
                        print("data received-> \(strData)")
                    }
                    else
                    {
                        print("No data available to read")
                    }
                }
            }
            ///
        })
    }
}

