﻿using System.Threading.Tasks;
using TaskManagement.Models;
using TaskManagement.Utils;
using static System.Collections.Specialized.BitVector32;

namespace TaskManagement.Interface
{
    public interface IUserRepository
    {
       
        ResponseObject GetUsers();
        User GetUserByID(int userId);

        ResponseObject GetWorkSpacesByUser(int userID);
        ResponseObject GetUserByUserName(string userName);
        //Hàm này sẽ trả về danh sách các user tham gia vào một section cụ thể.
        ResponseObject GetUsersJoinSection(int sectionID);

        //Hàm này sẽ trả về danh sách các user đang tham gia vào một nhiệm vụ cụ thể.
        ResponseObject GetUsersJoinTask(int taskID);
        ResponseObject CreateUser(User user);
        ResponseObject UpdateUser(User user);
        ResponseObject DeleteUser(User user);

        ResponseObject Login(User user);
        bool UserExists(int userId);
        bool UserNameExists(string userName);
        bool Save();
        





    }
}
