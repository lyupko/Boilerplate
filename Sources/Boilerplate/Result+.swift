//===--- Result+.swift ------------------------------------------------------===//
//Copyright (c) 2016 Daniel Leping (dileping)
//
//Licensed under the Apache License, Version 2.0 (the "License");
//you may not use this file except in compliance with the License.
//You may obtain a copy of the License at
//
//http://www.apache.org/licenses/LICENSE-2.0
//
//Unless required by applicable law or agreed to in writing, software
//distributed under the License is distributed on an "AS IS" BASIS,
//WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//See the License for the specific language governing permissions and
//limitations under the License.
//===----------------------------------------------------------------------===//

import Foundation
import Result

public func materializeAny<T>(_ f:() throws -> T) -> Result<T, AnyError> {
    return materializeAny(try f())
}

public func materializeAny<T>(_ f:@autoclosure () throws -> T) -> Result<T, AnyError> {
    do {
        return .success(try f())
    } catch let e as AnyError {
        return .failure(e)
    } catch let e {
        return .failure(AnyError(e))
    }
}

public extension Result where Error : AnyErrorProtocol {
    public init(error: Swift.Error) {
        self.init(error: Error(error))
    }
    
    public func dematerializeAny() throws -> T {
        switch self {
        case let .success(value):
            return value
        case let .failure(error):
            throw error.error
        }
    }
}
