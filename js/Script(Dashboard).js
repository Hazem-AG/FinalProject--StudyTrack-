function fetchTasks() {
  fetch("../php/courses.php")
    .then((response) => response.json())
    .then((data) => {
      console.log("Fetched data:", data);
      var ul = document.querySelector("#Subject .dropdown-menu");
      ul.innerHTML = ""; 
      data.forEach((task) => {
        const uniqueId = `task_${task.id}`;
        var li = document.createElement("li");
        li.innerHTML = `
          <input type="radio" id="${uniqueId}" name="department_id" value="${task.id}" required>
          <label for="${uniqueId}" class="dropdown-item">${task.name}</label>
        `;
        ul.appendChild(li);
      });
    })
    .catch((error) => console.error("Error fetching tasks:", error));
}

fetchTasks();
