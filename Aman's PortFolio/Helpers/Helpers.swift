//
//  Helpers.swift
//  Aman's PortFolio
//
//  Created by Aman Bhatt on 24/08/24.
//

import Foundation
import UIKit
final class Helpers: NSObject{
    static let sharedInstance = Helpers()
    private override init() { }
    func readJSONFile(forName name: String, completion: @escaping(([String:Any]) -> Void)) {
        do {
            if let bundlePath = Bundle.main.path(forResource: name, ofType: "geojson"),
               let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) {
                if let json = try JSONSerialization.jsonObject(with: jsonData, options: .mutableLeaves) as? [String: Any] {
                    print("JSON: \(json)")
                    completion(json)
                } else {
                    print("Given JSON is not a valid dictionary object.")
                }
            }
        } catch {
            print(error)
        }
    }
    func heightForText(string: String, width: CGFloat, font: UIFont) -> CGFloat {
        let attrString = NSAttributedString(
            string: string,
            attributes: [NSAttributedString.Key.font: font])
        let size = attrString.boundingRect(
        with: CGSize(width: width, height: CGFloat.greatestFiniteMagnitude),
        options: NSStringDrawingOptions.usesLineFragmentOrigin, context: nil)
        return size.height
    }
}
