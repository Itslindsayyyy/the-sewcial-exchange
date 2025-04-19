<script>
  document.addEventListener("DOMContentLoaded", function () {
    const addTaskBtn = document.getElementById("add-task");
    const tasksContainer = document.getElementById("tasks-container");

    addTaskBtn.addEventListener("click", function () {
      const newTaskRow = document.createElement("div");
      newTaskRow.classList.add("row", "mb-2", "task-row");

      newTaskRow.innerHTML = `
        <div class="col-md-6">
          <input type="text" name="swap[tasks_attributes][][name]" class="form-control" placeholder="Task name">
        </div>
        <div class="col-md-6">
          <input type="date" name="swap[tasks_attributes][][due_date]" class="form-control" placeholder="Due date">
        </div>
      `;

      tasksContainer.appendChild(newTaskRow);
    });
  });
</script>
