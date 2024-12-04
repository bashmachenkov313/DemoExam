using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using ООО_Техносервис.Classes;
using ООО_Техносервис.View;

namespace ООО_Техносервис
{
    public partial class Autharization : Form
    {
        public Autharization()
        {
            InitializeComponent();
            try
            {
                Helper.DB = new Model.RequestEntities();
                
            }
            catch 
            {
                MessageBox.Show("Свзь с базой не установлена");
            }
        }

        private void buttonExit_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void buttonAuth_Click(object sender, EventArgs e)
        {
            string login = textBoxLogin.Text;
            string password = textBoxPassword.Text;
            List<Model.User> users = new List<Model.User>();
            users = Helper.DB.User.Where(u => u.UserLogin == login && u.UserPassword == password).ToList();
            Helper.user = users.FirstOrDefault();
            if (Helper.user != null)
            {
                MessageBox.Show($"Вы успешно вошли. Ваша роль: {Helper.user.Role.RoleName.ToString()}");
                ListRequests listRequests = new ListRequests();
                this.Hide();
                listRequests.ShowDialog();
                this.Show();
            }
            else { MessageBox.Show("Такого пользователя нет."); }
        }
    }
}
