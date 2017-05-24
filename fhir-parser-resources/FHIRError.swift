//
//  FHIRError.swift
//  SwiftFHIR
//
//  Created by Pascal Pfiffner on 11/24/15.
//  2015, SMART Health IT.
//

import Foundation


/**
FHIR errors.
*/
public enum FHIRError: Error, CustomStringConvertible {
	case error(String)
	
	case resourceLocationUnknown
	case resourceWithoutServer
	case resourceWithoutId
	case resourceAlreadyHasId
	
	/// The resource at path (1st string) could not be instantiated because of error (2nd string).
	case resourceFailedToInstantiate(String, String)
	
	/// The resource failed validation
	case resourceFailedToValidate(FHIRValidationError)
	case resourceCannotContainItself
	
	case operationConfigurationError(String)
	case operationInputParameterMissing(String)
	case operationNotSupported(String)
	
	case searchResourceTypeNotDefined
	
	/// JSON parsing failed for reason in 1st argument, full JSON string is 2nd argument.
	case jsonParsingError(String, String)
	
	
	// MARK: - CustomStringConvertible
	
	public var description: String {
		switch self {
		case .error(let message):
			return message
		
		case .resourceLocationUnknown:
			return "The location of the resource is not known".fhir_localized
		case .resourceWithoutServer:
			return "The resource does not have a server instance assigned".fhir_localized
		case .resourceWithoutId:
			return "The resource does not have an id, cannot proceed".fhir_localized
		case .resourceAlreadyHasId:
			return "The resource already have an id, cannot proceed".fhir_localized
		case .resourceFailedToInstantiate(let path, let error):
			return "\("Failed to instantiate resource when trying to read from".fhir_localized) «\(path)»: \(error)"
		case .resourceFailedToValidate(let error):
			return "\("Failed to validate resource".fhir_localized): \(error)"
		case .resourceCannotContainItself:
			return "A resource cannot contain itself".fhir_localized
		
		case .operationConfigurationError(let message):
			return message
		case .operationInputParameterMissing(let name):
			return "\("Operation is missing input parameter".fhir_localized): “\(name)”"
		case .operationNotSupported(let name):
			return "\("Operation is not supported".fhir_localized): \(name)"
			
		case .searchResourceTypeNotDefined:
			return "Cannot find the resource type against which to run the search".fhir_localized
		
		case .jsonParsingError(let reason, let raw):
			return "\("Failed to parse JSON".fhir_localized): \(reason)\n\(raw)"
		}
	}
}

extension Error {
	
	/**
	Converts any `Error` into `FHIRError`; returns self if the receiver is a FHIRError already.
	*/
	public var asFHIRError: FHIRError {
		if let ferr = self as? FHIRError {
			return ferr
		}
		if let verr = self as? FHIRValidationError {
			return FHIRError.resourceFailedToValidate(verr)
		}
		return FHIRError.error("\(localizedDescription)")
	}
}

extension String {
	/**
	Convenience getter using `NSLocalizedString()` with no comment.
	
	TODO: On Linux this currently simply returns self
	*/
	public var fhir_localized: String {
		#if os(Linux)
			return self
		#else
			return NSLocalizedString(self, comment: "")
		#endif
	}
}

