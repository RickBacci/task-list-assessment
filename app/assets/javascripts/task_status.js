$(document).ready(function() {

  $('tbody#tasks-table').on('click', function(event) {
    event.preventDefault();

      var buttonText = event.target.text;
      var taskId     = event.target.dataset.task_id;
      var tasklistId = event.target.dataset.tasklist_id;

      updateStatus(buttonText, tasklistId, taskId);

    function updateStatus (buttonText, tasklistId, taskId) {

      $.ajax({
        url: '/update_task_status',
        type: 'post',
        data: { task_id:     taskId,
                tasklist_id: tasklistId
        },
        success: function(data) {
          var buttonText = event.target.text;
          var getRow     = event.target.parentNode.parentNode;
          var taskId     = event.target.dataset.task_id;
          var buildId    = "#task-status-" + taskId
          debugger;

          if ( buttonText.localeCompare("Incomplete") ) {
            event.target.text = "Complete"
            $(buildId).text('Incomplete')
          } else {
            event.target.text = "Incomplete"
            $(buildId).text('Complete')
          }

        },
        error: function(xhr) {
          debugger;
          console.log(xhr.responseText)
        }
      });

    }
  });

  $('#links').DataTable( {
    "order": [[ 3, "desc" ]]
  } );
});

