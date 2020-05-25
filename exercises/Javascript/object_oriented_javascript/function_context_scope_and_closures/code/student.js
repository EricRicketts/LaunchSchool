let createStudent = (function() {
  function alreadyEnrolled(course, repository) {
    return repository.courses.some((enrolledCourse) => {
      return enrolledCourse.name === course.name && enrolledCourse.code === course.code;
    });
  }
  function duplicateNote(course, note) {
    let notes = course.note.split('\n');
    return notes.includes(note);
  }
  function findCourseByCode(courses, code) {
    return courses.find((course) => course.code === code);
  }
  function getAllCourseCodes(repository) {
    return repository.courses.reduce((courseCodes, course) => {
      courseCodes.push(course.code);
      return courseCodes;
    }, []);
  }
  function getAllCourseNames(repository) {
    return repository.courses.reduce((courseNames, course) => {
      courseNames.push(course.name);
      return courseNames;
    }, []);
  }
  function inValidCourse(course, repository) {
    let allCourseNames = getAllCourseNames(repository);
    let allCourseCodes = getAllCourseCodes(repository);

    return !allCourseNames.includes(course.name) || !allCourseCodes.includes(course.code);
  }
  return function (name, year) {
    return {
      courses: [],
      addCourse: function (course, school) {
        if (inValidCourse(course, school)) {
          return 'Invalid course, not added.';
        } else if (alreadyEnrolled(course, this)) {
          return 'Already enrolled, course not added.';
        } else {
          this.courses.push(course);
          return `Course ${course.name}: ${course.code} added.`;
        }
      },
      addNote: function(code, note) {
        let trimmedNote = note.trim();
        let success = `added note: ${note}`;
        let course = findCourseByCode(this.courses, code);
        if (course && course.note && duplicateNote(course, note)) {
          return 'Duplicate note, not added.';
        } else if (course && course.note) {
          course.note += `\n${trimmedNote}`;
          return success;
        } else if (course) {
          course.note = `\n${trimmedNote}`;
          return success;
        } else {
          return 'course not found, no note added.';
        }
      },
      clearCourses: function () {
        return this.courses = [];
      },
      getName: function() {
        return name;
      },
      getYear: function() {
        return year;
      },
      info: function() {
        return `${name} is a ${year} year student.`;
      },
      listCourses: function () {
        return JSON.stringify(this.courses);
      },
      updateNote: function(code, note) {
        let trimmedNote = note.trim();
        let course = findCourseByCode(this.courses, code);
        if (course) {
          course.note = `\n${note}`;
          return `Updated ${course.name}: ${course.code} note with \"${note}\"`;
        } else {
          return 'course not found, no update.';
        }
      },
      viewNotes: function() {
        let coursesWithNotes = this.courses.filter((course) => course.note );
        return coursesWithNotes.reduce((arr, course) => {
           let str = `${course.name}:${course.note}`;
           arr.push(str);
           return arr;
        }, []).join('\n');
      }
    }
  }
})()

export { createStudent };