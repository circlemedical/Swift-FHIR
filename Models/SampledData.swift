//
//  SampledData.swift
//  SMART-on-FHIR
//
//  Generated from FHIR 0.0.81.2382 on 2014-07-23.
//  Copyright (c) 2014 SMART Platforms. All rights reserved.
//

import Foundation


/**
 *  A series of measurements taken by a device.
 */
public class SampledData: FHIRElement
{
	override public class var resourceName: String {
		get { return "SampledData" }
	}
	
	/** Zero value and units */
	public var origin: Quantity?
	
	/** Number of milliseconds between samples */
	public var period: NSDecimalNumber?
	
	/** Multiply data by this before adding to origin */
	public var factor: NSDecimalNumber?
	
	/** Lower limit of detection */
	public var lowerLimit: NSDecimalNumber?
	
	/** Upper limit of detection */
	public var upperLimit: NSDecimalNumber?
	
	/** Number of sample points at each time point */
	public var dimensions: Int?
	
	/** Decimal values with spaces, or "E" | "U" | "L" */
	public var data: String?
	
	public convenience init(origin: Quantity?, period: NSDecimalNumber?, dimensions: Int?, data: String?) {
		self.init(json: nil)
		if origin {
			self.origin = origin
		}
		if period {
			self.period = period
		}
		if dimensions {
			self.dimensions = dimensions
		}
		if data {
			self.data = data
		}
	}	
	
	public init(json: NSDictionary?) {
		super.init(json: json)
		if let js = json {
			if let val = js["origin"] as? NSDictionary {
				self.origin = Quantity(json: val)
			}
			if let val = js["period"] as? String {
				self.period = NSDecimalNumber(json: val)
			}
			if let val = js["factor"] as? String {
				self.factor = NSDecimalNumber(json: val)
			}
			if let val = js["lowerLimit"] as? String {
				self.lowerLimit = NSDecimalNumber(json: val)
			}
			if let val = js["upperLimit"] as? String {
				self.upperLimit = NSDecimalNumber(json: val)
			}
			if let val = js["dimensions"] as? Int {
				self.dimensions = val
			}
			if let val = js["data"] as? String {
				self.data = val
			}
		}
	}
}
