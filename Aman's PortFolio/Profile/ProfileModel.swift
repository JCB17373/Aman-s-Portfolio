//
//  ProfileModel.swift
//  Aman's PortFolio
//
//  Created by Aman Bhatt on 25/08/24.
//

import Foundation

struct ProfileModel : Codable{
    var name: String
    var current_designation: String
    var current_company: String
    var current_address: String
    var highest_education: String
    var highest_education_stream: String
    var highest_education_from: String
    var highest_education_to: String
    var about: String
    var contact_email: String
    var contact_number: String
    var highest_education_college: String
    var openToWork: Bool
    var experience: [Experience]
    var job_preferences: [JobPreference]
   
    
}
struct Experience: Codable{
    var company_name: String
    var job_type: String
    var company_address: String
    var total_years: String
    var total_months: String
    var joined_on: String
    var releave_on: String
    var designation: String
    var description: String
}
struct JobPreference: Codable{
    var name: String
    var data: [String]
    
}
