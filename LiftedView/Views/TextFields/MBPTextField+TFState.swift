extension MBPTextField {
    enum TFState {
        case active
        case error
        case empty
        case `default`
    }
    
    var state: TFState {
        if hasError {
            return .error
        } else if isResponder {
            return .active
        } else if value.isEmpty {
            return .empty
        } else {
            return .default
        }
    }
}
