//===--- AnyContainer.swift ------------------------------------------------------===//
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

//useful for C-interoperability when you need to pass non-AnyObject inside C
open class AnyContainer<T> : ContainerType {
    public typealias Value = T
    
    internal (set) public var content:T
    
    public init(_ content:T) {
        self.content = content
    }
    
    public func withdraw() throws -> Value {
        return content
    }
}

open class MutableAnyContainer<T> : AnyContainer<T> {
    public override var content:T {
        get {
            return super.content
        }
        set {
            super.content = newValue
        }
    }
    
    public override init(_ content:T) {
        super.init(content)
    }
}