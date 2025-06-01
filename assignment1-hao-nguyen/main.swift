//
//  main.swift
//  assignment1-hao-nguyen
//
// This code was written by Hao Nguyen, 991521091
//

var input: String = ""
while (!userQuits(input: input)) {
    printInstructions()
    input = readLine() ?? ""
    
    switch input {
        case "q":
            print("Exiting... Au revoir !")
            break
        case "1":
            showAddStudentMenu()
        case "2":
            viewStudents()
        case "3":
            showAverageGradeMenu()
        case "4":
            showPassingandFailingStudentsMenu()
        default:
            print("Invalid menu option. Please try again.")
            printDelimeter()
    }
}

func showAddStudentMenu() {
    let studentId = promptStudentId()
    
    let studentName = promptStudentName()
    
    let studentGrades = promptStudentGrades()

    StudentList.addStudent(student: Student(studentId: studentId, studentName: studentName, studentGrades: studentGrades))
    
    printDelimeter()
}

func promptStudentId() -> Int {
    print("Enter student's ID:")
    var studentId = 0
    while (studentId == 0) {
        var input = ""
        if let unwrappedInput = readLine() {
            input = unwrappedInput
        }
        
        if let id = Int(input), Student.validateId(id: id) {
            if StudentList.containsStudent(id: id) {
                print("There's already a student with ID \(id)")
            }
            else {
                studentId = id
                break;
            }
        }
        
        print("Invalid value. Please try again.")
    }
    
    return studentId
}

func promptStudentName() -> String {
    print("Enter student's name:")

    while true {
        guard let name = readLine(), !name.isEmpty else {
            print("Student name cannot be empty")
            continue
        }
        return name
    }
}

func promptStudentGrades() -> [Double] {
    var studentGrades: [Double] = []
    print("Enter student's grades, press q to stop:")
    
    // Loop until user enters "q"
    while true {
        let input: String = readLine() ?? ""

        if (userQuits(input: input)) {
            break
        }
        
        if let grade = Double(input), Student.validateGrade(grade: grade) {
            studentGrades.append(grade)
            continue
        }
        
        print("Invalid value. Please try again.")
    }
    
    return studentGrades
}

func viewStudents() {
    let studentList = StudentList.getList()
    print("Student List [\(studentList.count) student\(studentList.count > 1 ? "s" : "")]")
    for student in studentList {
        print("\tID: \(student.id), name: \(student.name), grades: \(student.grades)")
    }
    printDelimeter()
}

func showAverageGradeMenu() {
    print("Enter student's ID:")
    
    // Prompt id
    var studentId = 0
    if let unwrappedId = Int(readLine() ?? "") {
        studentId = unwrappedId
    }
    
    printAverage(studentId: studentId)
    
    printDelimeter()
}

func printAverage(studentId: Int) {
    let student = StudentList.getStudent(id: studentId)
    
    if let unwrapped = student {
        print ("Student with id \(studentId) has an average grade of \(unwrapped.averageGrade())")
        return
    }
    
    print ("Can't find student with id \(studentId)")
}

func showPassingandFailingStudentsMenu() {
    print("Enter grade threshold:")
    
    // Prompt threshold
    var threshold = 0.0
    if let unwrapped = Double(readLine() ?? "") {
        threshold = unwrapped
    }
    
    passOrFailStudents(threshold: threshold)
    
    printDelimeter()
}

func passOrFailStudents(threshold: Double) {
    var passedStudents: [Student] = []
    var failedStudents: [Student] = []
    
    let studentList = StudentList.getList()
    for student in studentList {
        if (student.isPassing(threshold: threshold)) {
            passedStudents.append(student)
            continue
        }
        
        failedStudents.append(student)
    }
    
    printDelimeter()
    print("Passing students:")
    for student in passedStudents {
        print("\(student.name)")
    }
    
    print()
    print("Failing students:")
    for student in failedStudents {
        print("\(student.name)")
    }
}

func userQuits (input: String?) -> Bool {
    return input?.lowercased() == "q"
}

func printDelimeter() {
    print("----------------------------------")
}

func printInstructions() {
    print("Enter 1 to add student")
    print("      2 to view students")
    print("      3 to view the average grade of a specific student")
    print("      4 to view passed and failed students")
    print("      q to quit")
    printDelimeter()
}
