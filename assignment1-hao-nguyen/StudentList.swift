//
//  StudentList.swift
//  assignment1-hao-nguyen
//
// This code was written by Hao Nguyen, 991521091
//

class StudentList {
    private static var _studentList: [Student] = []
    
    static func getList() -> [Student] {
        return _studentList
    }
    
    static func getStudent(id: Int) -> Student? {
        for student in _studentList {
            if (student.id != id) {
                continue
            }
            
            return student
        }
        
        return nil
    }
        
    static func containsStudent(id: Int) -> Bool {
        return getStudent(id: id) != nil
    }
    
    static func addStudent(student: Student) {
        _studentList.append(student)
    }
}
