//
//  ContentView.swift
//  WordScramble
//
//  Created by aeglus on 2021/11/29.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        let input = "a b c"
        let letters = input.components(separatedBy: " ")
        let letter = letters.randomElement()
        let trimmed = letter?.description.trimmingCharacters(in: .whitespacesAndNewlines)
        let word = "swift"
        let checker = UITextChecker()
        let range = NSRange(location: 0, length: word.utf16.count)
        let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
        let allGood = misspelledRange.location == NSNotFound
        HStack {
            List {
                Section(trimmed ?? "o") {
                    ForEach(0..<5) {
                        Text("Dynamic row \($0)")
                    }
                }
                Section("Section 2") {
                    Text("Static Row 1")
                }
            }
            .listStyle(.inset)
            Form {
                Text("Hello")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
