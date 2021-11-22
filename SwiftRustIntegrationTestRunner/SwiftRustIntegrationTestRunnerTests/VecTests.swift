//
//  VecTests.swift
//  SwiftRustIntegrationTestRunnerTests
//
//  Created by Frankie Nwafili on 11/21/21.
//

import XCTest
@testable import SwiftRustIntegrationTestRunner

class VecTests: XCTestCase {
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testRustVecU8() throws {
        let start: [UInt8] = [1, 9, 3, 4, 5]
        
        let buffer = UnsafeBufferPointer(start: UnsafePointer(start), count: start.count)
        let vec = create_vec_u8(buffer)
        
        XCTAssertEqual(vec.len(), 5)
        
        vec.push(value: 10)
        XCTAssertEqual(vec.len(), 6)
        
        XCTAssertEqual(vec.pop(), 10)
        XCTAssertEqual(vec.len(), 5)
        
        XCTAssertEqual(vec.get(index: 1), 9)
    }
    
    func testRustVecI32() throws {
        let start: [Int32] = [1, 9, 3, 4, 5]
        let buffer = UnsafeBufferPointer(start: UnsafePointer(start), count: start.count)
        let vec = create_vec_i32(buffer)
        
        XCTAssertEqual(vec.len(), 5)
        
        vec.push(value: 10)
        XCTAssertEqual(vec.len(), 6)
        
        XCTAssertEqual(vec.pop(), 10)
        XCTAssertEqual(vec.len(), 5)
        
        XCTAssertEqual(vec.get(index: 1), 9)
    }
    
    /// Verify that we can construct a RustVec of every primitive type.
    /// We tested all of the methods on  two different primitives above to be sure that our
    /// functions that generate the pieces of the RustVec support aren't accidentally hard coded to
    /// only work for one type.
    /// Here we call the rest of the types, confident that if we can construct them then the rest of their
    /// methods will work since they worked for the other types above.
    func testConstructPrimitiveRustVecs() throws {
        XCTAssertEqual(RustVec<UInt8>().pop(), 0);
        XCTAssertEqual(RustVec<UInt16>().len(), 0);
        XCTAssertEqual(RustVec<UInt32>().len(), 0);
        XCTAssertEqual(RustVec<UInt64>().len(), 0);
        XCTAssertEqual(RustVec<UInt>().len(), 0);
        
        XCTAssertEqual(RustVec<Int8>().len(), 0);
        XCTAssertEqual(RustVec<Int16>().len(), 0);
        XCTAssertEqual(RustVec<Int32>().len(), 0);
        XCTAssertEqual(RustVec<Int64>().len(), 0);
        XCTAssertEqual(RustVec<Int>().len(), 0);
        
        XCTAssertEqual(RustVec<Bool>().len(), 0);
    }
}

