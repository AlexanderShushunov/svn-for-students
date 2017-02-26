fs = require('fs');
fs.readFile('./student-list', 'utf8', function (err, data) {
    if (err) {
        return console.log("Can not read file 'student-list'. It should contain student names in 'Surname_Name' format.");
    }
    let students = data.split("\n").filter(student =>  student.length > 0);
    createPasswd(students);
    createAuthz(students)
});

function createPasswd(students) {
    deleteSilent("svn-conf/passwd");
    write("svn-conf/passwd", students.reduce((acc, student) => `${acc}\n${student} = ${student}`, "[users]\nadmin = admin"))
}

function createAuthz(students) {
    deleteSilent("svn-conf/authz");
    write("svn-conf/authz", students
        .map((student, number) => {
            return {
                student: student,
                partner: next(students, number)
            }
        }).map((pair) => `[/${pair.student}]\n${pair.student} = rw\n${pair.partner} = rw`)
        .concat("[/]\nadmin = rw")
        .join("\n\n"));
}

function next(students, number) {
    return students[(number + 1) % students.length];
}

function deleteSilent(filename) {
    fs.unlink(filename, () => {
    });
}

function write(filename, data) {
    fs.writeFile(filename, data, err => {
        if (err) {
            console.log(`Can not write ${filename}. Data: ${data}.`);
            throw err;
        }
        console.log(`Data was written in ${filename}.`);
    });
}