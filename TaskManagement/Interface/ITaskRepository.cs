﻿using TaskManagement.Models;
using TaskManagement.Utils;
using Task = TaskManagement.Models.Task;

namespace TaskManagement.Interface
{
    public interface ITaskRepository
    {
        //Hàm này sẽ trả về danh sách các task mà một user cụ thể được giao
        ResponseObject GetAssignedTasksForUser(int workspaceID,int userID);

        //Hàm này sẽ trả về danh sách các nhiệm vụ chưa được gán cho bất kỳ user nào trong một section cụ thể.
        ResponseObject GetUnassignedTasks(int workspaceID);

        //Hàm này sẽ trả về số lượng nhiệm vụ mà một user cụ thể đang tham gia.
        ResponseObject GetTaskCountOfUser(int workspaceID, int userId);

        //Hàm này sẽ trả về số lượng nhiệm vụ đã hoàn thành của một user cụ thể.
        ResponseObject GetTaskCountUserCompleted(int workspaceID, int userId, bool status);

        ResponseObject GetOngoingTasksInRangeTime(int userID,DateTime startDate, DateTime endDate);

        ResponseObject GetOngoingTasksInDay(int userID, DateTime date);

        ResponseObject TaskFilter(List<Task> tasks, int? userId, DateTime? fromDate, DateTime? toDate, bool? isCompleted, bool? isDueTomorrow, bool? isDueNextWeek, bool? isDueNextMonth);

        ResponseObject GetTasks();
        Task GetTaskByID(int taskId);
        ResponseObject CreateTask(int? sectionID, int userId, int roleId, Task task);
        ResponseObject UpdateTask(Task task);

        ResponseObject MoveTask(int taskID, int targetSectionID);
        ResponseObject DeleteTask(Task task);
        bool Save();

        //ResponseObject TasksFilter(int workSpaceID, int? day, bool? done, int? numMenber);
        ResponseObject AddMemberIntoTask(int taskID, int userID, int roleID);
        ResponseObject UpdateImage(int taskID, string file);
        ResponseObject GetTasksInSection(int sectionId);//Lấy task trong section
    }
}
