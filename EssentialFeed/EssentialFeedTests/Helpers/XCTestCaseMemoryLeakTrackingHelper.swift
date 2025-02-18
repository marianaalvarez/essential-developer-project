//
//  XCTestCaseMemoryLeakTrackingHelper.swift
//  EssentialFeedTests
//
//  Created by Mariana Alvarez de Carvalho on 10/1/2025.
//

import XCTest

extension XCTestCase {
    func trackForMemoryLeaks(_ instance: AnyObject, file: StaticString = #filePath, line: UInt = #line) {
        addTeardownBlock { [weak instance] in
            XCTAssertNil(instance, "Instance should have been deallocated. Potential memory leak.", file: file, line: line)
        }
    }
}


