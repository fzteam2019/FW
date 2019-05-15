using System;
using System.Data;
using System.Collections.Generic;
using Houses.DAL;
using Houses.Model;

namespace Houses.BLL
{

    /// <summary>
    /// User
    /// </summary>
    public partial class UserManager
    {
        static object userLock = new object();
        private readonly UserService dal = new UserService();
        public UserManager()
        { }
        #region  Method

        public bool Login(User user, out User gettedUser)
        {
            gettedUser = dal.GetModel(user.LoginName);
            if (gettedUser != null && gettedUser.Password == user.Password)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        public bool Register(User user)
        {
            lock (userLock)
            {
                //if (dal.Exists(user.LoginName))//用户是否存在
                //{
                //    return false;

                //}
                //else
                //{
                if (dal.Add(user) > 0)//添加用户成功
                    return true;
                //}
            }
            return false;
        }

        public bool Update(User user) {
            return dal.Update(user);
        }

        public List<User> UserList(string userName, int currentPage, int pageSize) {
            return dal.GetList(userName, currentPage, pageSize);
        }

        public User GetSingleUser(int id) {
            return dal.GetModel(id);
        }

        public bool Delete(int id) {
            return dal.Delete(id);
        }

        public List<Object> GetBarData() {
            return dal.GetBarData();
        }
        #endregion  Method
    }
}

