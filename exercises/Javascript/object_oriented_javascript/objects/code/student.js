function createStudent(name, year) {
  return {
    courses: [],
    name: name,
    year: year,
    addCourse: function(course) {
      return this.courses.push(course);
    },
    addNote: function(code, note) {
      let course = this.courses.find((course) => {
        return course.code === code;
      });
      if (course.note) {
        course.note = course.note + '; ' + note;
      } else {
        course.note = course.name + ': ' + note;
      }
    },
    info: function() {
      return this.name + ' is a ' + this.year + ' year ' + 'student';
    },
    listCourses: function() {
      return JSON.stringify(this.courses);
    },
    updateNotes(code, note) {
      let course = this.courses.find((course) => course.code === code);
      course.note = course.name + ': ' + note;
    },
    viewNotes: function() {
      return this.courses.filter((course) => !!course.note).map((course) => course.note).join('\n');
    }
  }
}

export { createStudent };