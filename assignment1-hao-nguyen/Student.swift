//
//  Student.swift
//  assignment1-hao-nguyen
//
// This code was written by Hao Nguyen, 991521091
//

class Student {
    var id: Int
    var name: String
    var grades: [Double]
    
    init(studentId: Int, studentName: String, studentGrades: [Double]) {
        id = studentId
        name = studentName
        grades = studentGrades
    }
    
    static func validateGrade(grade: Double) -> Bool {
        if (grade < 0) {
            print("Grade cannot be less than 0")
            return false
        }
        
        return true
    }
    
    static func validateId(id: Int) -> Bool {
        if (id <= 0) {
            print("ID cannot be less than or equal to 0")
            return false
        }
        
        return true
    }
    
    func averageGrade() -> Double {
        if (grades.isEmpty) {
            return 0
        }
        
        var sum: Double = 0
        for grade in grades {
            sum += grade
        }
        return sum / Double(grades.count)
    }
    
    func isPassing(threshold: Double) -> Bool {
        return averageGrade() >= threshold
    }
}
