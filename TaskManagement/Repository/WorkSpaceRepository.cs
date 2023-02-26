﻿using AutoMapper;
using Microsoft.EntityFrameworkCore;
using TaskManagement.Dto;
using TaskManagement.Interface;
using TaskManagement.Models;
using TaskManagement.Utils;

namespace TaskManagement.Repository
{
    public class WorkSpaceRepository : IWorkSpaceRepository
    {
        private readonly TaskManagementContext _context;
        private readonly IMapper _mapper;

        public WorkSpaceRepository(TaskManagementContext context, IMapper mapper)
        {
            _context = context;
            _mapper = mapper;
        }

        public ResponseObject AddMemberIntoWorkspace(int workSpaceID, string nameUser, int roleID)
        {
            var user = _context.Users.Where(u => u.UserName == nameUser).FirstOrDefault();
            var role = _context.Roles.Where(r => r.Id == roleID).FirstOrDefault();
            var workSpace = _context.WorkSpaces.Where(w => w.Id == workSpaceID).FirstOrDefault();
            var _user = _context.UserWorkSpaceRoles
                .Where(o => o.UserId == user.Id && o.WorkSpaceId == workSpace.Id).FirstOrDefault();

            if (user == null)
            {
                return new ResponseObject
                {
                    Status = "404",
                    Message = "Not Found User",
                    Data = null
                };
            }
            if (role == null)
            {
                return new ResponseObject
                {
                    Status = "404",
                    Message = "Not Found Role",
                    Data = null
                };
            }
            if (workSpace == null)
            {
                return new ResponseObject
                {
                    Status = "404",
                    Message = "Not Found WorkSpace",
                    Data = null
                };
            }
            if (_user != null)
            {
                return new ResponseObject
                {
                    Status = "400",
                    Message = "User already exists.",
                    Data = null
                };
            }
            var userWorkSpace = new UserWorkSpaceRole
            {
                UserId = user.Id,
                RoleId = roleID,
                WorkSpaceId = workSpaceID,
            };
            _context.UserWorkSpaceRoles.Add(userWorkSpace);

            if (Save())
            {
                return new ResponseObject
                {
                    Status = "204",
                    Message = "User added workSpace",
                    Data = userWorkSpace
                };
            }
            else
            {
                return new ResponseObject
                {
                    Status = "400",
                    Message = "Bad request",
                    Data = userWorkSpace
                };
            }
        }

        public ResponseObject CreateWorkSpace(int userID, int roleID, WorkSpace workSpaceCreate)
        {
            var user = _context.Users.Where(u => u.Id == userID).FirstOrDefault();
            var role = _context.Roles.Where(r => r.Id == roleID).FirstOrDefault();

            if (user == null)
            {
                return new ResponseObject
                {
                    Status = "404",
                    Message = "Bad request",
                    Data = null,
                };
            }
            if (role == null)
            {
                return new ResponseObject
                {
                    Status = "404",
                    Message = "Bad request",
                    Data = null,
                };
            }

            var userWorkSpace = new UserWorkSpaceRole
            {
                UserId = userID,
                RoleId = roleID,
                WorkSpaceId = workSpaceCreate.Id,
                Role = role,
                User = user,
                WorkSpace = workSpaceCreate,
            };
            _context.Add(userWorkSpace);
            _context.WorkSpaces.Add(workSpaceCreate);

            var wsMap = _mapper.Map<WorkSpaceDto>(workSpaceCreate);

            if (Save())
            {
                return new ResponseObject
                {
                    Status = "200",
                    Message = "Successfully",
                    Data = wsMap
                };
            }
            else
            {
                return new ResponseObject
                {
                    Status = "400",
                    Message = "Bad request"
                };
            }
        } 

        public ResponseObject DeleteWorkSpace(WorkSpace workSpace)
        {
            if (GetWorkSpaceByID(workSpace.Id) == null)
            {
                return new ResponseObject
                {
                    Status = "404",
                    Message = "Not found"
                };
            }
            _context.Remove(workSpace);
            if (Save())
            {
                return new ResponseObject
                {
                    Status = "204",
                    Message = "Successfully"
                };
            }
            else
            {
                return new ResponseObject
                {
                    Status = "400",
                    Message = "Bad request"
                };
            }
        }

        public ResponseObject GetWorkSpaceByCreateTime(int? month, int year)
        {
            var ws = _context.WorkSpaces
            .Where(w => (w.CreatedTime.Month == month || !month.HasValue)
            && w.CreatedTime.Year == year).ToList();
            var wsMap = _mapper.Map<List<WorkSpaceDto>>(ws);

            if (ws != null)
            {
                return new ResponseObject
                {
                    Status = "200",
                    Message = "Successfully",
                    Data = wsMap
                };
            }
            else
            {
                return new ResponseObject
                {
                    Status = "400",
                    Message = "Bad Request",
                    Data = null
                };
            }
        }
        public WorkSpace GetWorkSpaceByID(int workSpaceID)
        => _context.WorkSpaces.Where(o => o.Id == workSpaceID).FirstOrDefault();
        public bool Save()
        {
            var saved = _context.SaveChanges();
            return saved > 0 ? true : false;
        }

        public ResponseObject UpdateWorkSpace(WorkSpace workSpace)
        {
            _context.WorkSpaces.Update(workSpace);
            var wsMap = _mapper.Map<WorkSpaceDto>(workSpace);
            if (GetWorkSpaceByID(workSpace.Id) == null)
            {
                return new ResponseObject
                {
                    Status = "404",
                    Message = "Bad request",
                    Data = null
                };
            }

           
            if (Save())
                return new ResponseObject
                {
                    Status = "200",
                    Message = "successfully",
                    Data = wsMap
                };
            else
                return new ResponseObject
                {
                    Status = "400",
                    Message = "Bad request",
                    Data = null
                };
        }

        public ResponseObject WorkSpaces()
        {
            var ws = _context.WorkSpaces.ToList();
            var wsMap = _mapper.Map<List<WorkSpaceDto>>(ws);

            if (ws != null)
            {
                return new ResponseObject
                {
                    Status = "200",
                    Message = "Successfully",
                    Data = wsMap
                };
            }
            else
            {
                return new ResponseObject
                {
                    Status = "400",
                    Message = "Bad Request",
                    Data = null
                };
            }
        }
    }
}
