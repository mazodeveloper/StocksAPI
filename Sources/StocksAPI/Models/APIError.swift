import Foundation

public enum APIError: CustomNSError {
    case invalidURL
    case invalidResponseType
    case httpStatusCodeFailed(statusCode: Int, error: ErrorResponse?)

    public static var errorDomain: String {
        "StocksAPI"
    }

    public var errorCode: Int {
        switch self {
        case .invalidURL:
            return 0
        case .invalidResponseType:
            return 0
        case .httpStatusCodeFailed(let statusCode, _):
            return statusCode
        }
    }

    public var errorUserInfo: [String : Any] {
        var text: String
        switch self {
        case .invalidURL:
            text = "Invalid URL"
        case .invalidResponseType:
            text = "Invalid Response type"
        case .httpStatusCodeFailed(let statusCode, let error):
            if let error = error {
                text = "Error Status Code: \(statusCode), message: \(error)"
            } else {
                text = "Error Status Code: \(statusCode)"
            }
        }

        return [NSLocalizedDescriptionKey: text]
    }
}
