//
//  Flag.swift
//  TenAroundMe
//
//  Created by Sefa İbiş on 19.06.2023.
//

@propertyWrapper
struct Flag {
    private var value: Bool = false
    
    var wrappedValue: Bool {
        get { value }
        set { value = newValue }
    }
    
    var isActive: Bool {
        value
    }
    
    mutating func set(active: Bool) {
        value = active
    }
}
