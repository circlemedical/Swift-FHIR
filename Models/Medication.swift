//
//  Medication.swift
//  SMART-on-FHIR
//
//  Generated from FHIR 0.0.81.2382 on 2014-07-23.
//  Copyright (c) 2014 SMART Platforms. All rights reserved.
//

import Foundation


/**
 *  Definition of a Medication.
 *
 *  Scope and Usage Representing Medication in the majority of healthcare settings is a matter of identifying an
 *  item from a list and then conveying a reference for the item selected either into a patient related resource
 *  or to other applications. Additional information about the medication is frequently provided for human
 *  verification but a full representation of the details of composition and efficacy of the medicine is conveyed
 *  by referring to drug dictionaries by means of the codes they define. There are some occasions where it is
 *  necessary to identify slightly more detail, such as when dispensing a package containing a particular medicine
 *  requires identification both of the medicine and the package at once. There are also some occasions (e.g.
 *  custom formulations) where the composition of a medicine must be represented. In these cases the ingredients
 *  of the medicine have to be specified together with the amount contained, though the medication resource does
 *  not provide full details.
 *  
 *  The medication resource allows for medications to be characterised as either a product or a package; this
 *  classification is important because it affects the interpretation of a prescribed amount. For instance, is the
 *  prescribed amount 20 tablets, or 20 packages of 50 tablets each? However the kind element is not required
 *  because not all contexts of use are involved with prescription (medication statements, for instance).
 *  Typically, however, profiles describing the use of the medication resource in a prescribing environment will
 *  make the kind element required.
 *  
 *  Depending on whether the medication is a product or a package, further details about the composition can be
 *  provided. A product has a form (tablet, suspension, etc.) and a list of ingredients with quantities. The
 *  ingredients may be other medications or substances. A package has a container (vacuum packed box, jar, etc.)
 *  and a list of the products or other packages that are in the package.
 */
public class Medication: FHIRResource
{
	override public class var resourceName: String {
		get { return "Medication" }
	}
	
	/** Text summary of the resource, for human interpretation */
	public var text: Narrative?
	
	/** Common / Commercial name */
	public var name: String?
	
	/** Codes that identify this medication */
	public var code: CodeableConcept?
	
	/** True if a brand */
	public var isBrand: Bool?
	
	/** Manufacturer of the item */
	public var manufacturer: FHIRElement? {
		get { return resolveReference("manufacturer") }
		set {
			if newValue {
				didSetReference(newValue!, name: "manufacturer")
			}
		}
	}
	
	/** product | package */
	public var kind: String?
	
	/** Administrable medication details */
	public var product: MedicationProduct?
	
	/** Details about packaged medications */
	public var package: MedicationPackage?
	
	
	public init(json: NSDictionary?) {
		super.init(json: json)
		if let js = json {
			if let val = js["text"] as? NSDictionary {
				self.text = Narrative(json: val)
			}
			if let val = js["name"] as? String {
				self.name = val
			}
			if let val = js["code"] as? NSDictionary {
				self.code = CodeableConcept(json: val)
			}
			if let val = js["isBrand"] as? Int {
				self.isBrand = (1 == val)
			}
			if let val = js["manufacturer"] as? NSDictionary {
				self.manufacturer = ResourceReference(json: val)
			}
			if let val = js["kind"] as? String {
				self.kind = val
			}
			if let val = js["product"] as? NSDictionary {
				self.product = MedicationProduct(json: val)
			}
			if let val = js["package"] as? NSDictionary {
				self.package = MedicationPackage(json: val)
			}
		}
	}
}


/**
 *  Administrable medication details.
 *
 *  Information that only applies to products (not packages).
 */
public class MedicationProduct: FHIRElement
{	
	/** powder | tablets | carton + */
	public var form: CodeableConcept?
	
	/** Active or inactive ingredient */
	public var ingredient: [MedicationProductIngredient]?
	
	
	public init(json: NSDictionary?) {
		super.init(json: json)
		if let js = json {
			if let val = js["form"] as? NSDictionary {
				self.form = CodeableConcept(json: val)
			}
			if let val = js["ingredient"] as? [NSDictionary] {
				self.ingredient = MedicationProductIngredient.from(val) as? [MedicationProductIngredient]
			}
		}
	}
}


/**
 *  Active or inactive ingredient.
 *
 *  Identifies a particular constituent of interest in the product.
 */
public class MedicationProductIngredient: FHIRElement
{	
	/** The product contained */
	public var item: FHIRElement? {
		get { return resolveReference("item") }
		set {
			if newValue {
				didSetReference(newValue!, name: "item")
			}
		}
	}
	
	/** How much ingredient in product */
	public var amount: Ratio?
	
	public convenience init(item: ResourceReference?) {
		self.init(json: nil)
		if item {
			self.item = item
		}
	}	
	
	public init(json: NSDictionary?) {
		super.init(json: json)
		if let js = json {
			if let val = js["item"] as? NSDictionary {
				self.item = ResourceReference(json: val)
			}
			if let val = js["amount"] as? NSDictionary {
				self.amount = Ratio(json: val)
			}
		}
	}
}


/**
 *  Details about packaged medications.
 *
 *  Information that only applies to packages (not products).
 */
public class MedicationPackage: FHIRElement
{	
	/** E.g. box, vial, blister-pack */
	public var container: CodeableConcept?
	
	/** What is  in the package? */
	public var content: [MedicationPackageContent]?
	
	
	public init(json: NSDictionary?) {
		super.init(json: json)
		if let js = json {
			if let val = js["container"] as? NSDictionary {
				self.container = CodeableConcept(json: val)
			}
			if let val = js["content"] as? [NSDictionary] {
				self.content = MedicationPackageContent.from(val) as? [MedicationPackageContent]
			}
		}
	}
}


/**
 *  What is  in the package?.
 *
 *  A set of components that go to make up the described item.
 */
public class MedicationPackageContent: FHIRElement
{	
	/** A product in the package */
	public var item: FHIRElement? {
		get { return resolveReference("item") }
		set {
			if newValue {
				didSetReference(newValue!, name: "item")
			}
		}
	}
	
	/** How many are in the package? */
	public var amount: Quantity?
	
	public convenience init(item: ResourceReference?) {
		self.init(json: nil)
		if item {
			self.item = item
		}
	}	
	
	public init(json: NSDictionary?) {
		super.init(json: json)
		if let js = json {
			if let val = js["item"] as? NSDictionary {
				self.item = ResourceReference(json: val)
			}
			if let val = js["amount"] as? NSDictionary {
				self.amount = Quantity(json: val)
			}
		}
	}
}
