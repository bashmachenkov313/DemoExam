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
using ООО_Техносервис.Model;

namespace ООО_Техносервис.View
{
    public partial class ListRequests : Form
    {
        List<Model.Request> requests = new List<Model.Request>();
        public ListRequests()
        {
            InitializeComponent();
        }

        private void buttonExit_Click(object sender, EventArgs e)
        {

            this.Close();
        }

        private void ShowRequests()
        {
            //requests = Helper.DB.Request.ToList();
            //if (Helper.user.UserRoleId == 1) 
            //{
            //    requests = requests.Where(r=>r.RequestUserId==Helper.user.UserId).ToList();
            //}
            gridRequests.Rows.Clear();
            int i = 0;
            foreach (Model.Request request in requests)
            {
                gridRequests.Rows.Add();
                gridRequests.Rows[i].Cells[0].Value = request.RequestId.ToString();
                gridRequests.Rows[i].Cells[1].Value = request.RequestDate.ToShortDateString();
                gridRequests.Rows[i].Cells[2].Value = request.Equipment.EquipmentName.ToString();
                gridRequests.Rows[i].Cells[3].Value = request.User1.UserFullName.ToString();
                gridRequests.Rows[i].Cells[4].Value = request.Status.StatusName.ToString();
                gridRequests.Rows[i].Cells[5].Value = request.User.UserFullName.ToString();
                gridRequests.Rows[i].Cells[6].Value = request.Stage.StageName.ToString();
                
                i++;
            }
        }

        private void LoadRequests()
        {
            requests = Helper.DB.Request.ToList();
            string roleName = Helper.user.Role.RoleName.ToString();
            if (roleName.Equals("Мастер"))
            {
                requests = requests.Where(r => r.RequestMasterId.Equals(Helper.user.UserId)).ToList();
            }
            else if (roleName.Equals("Заказчик"))
            {
                requests = requests.Where(r => r.RequestUserId.Equals(Helper.user.UserId)).ToList();
            }
            // Для других ролей: Оператор и Менеджер - вроде все заявки
        }
        private void LoadComboBoxStatus()
        {
            List<string> statusNames = Helper.DB.Status.Select(s => s.StatusName).ToList();
            comboBoxStatus.Items.Add("Все статусы");
            foreach (string statusName in statusNames)
            {
                comboBoxStatus.Items.Add(statusName);
            }
            comboBoxStatus.SelectedItem = "Все статусы";
        }
        public void ChangeButtonsVisibility()
        {
            buttonNewRequest.Visible = buttonEditRequest.Visible = buttonReport.Visible = false;
            switch (Helper.user.Role.RoleName)
            {
                case "Мастер":
                    buttonEditRequest.Visible = true;
                    break;

                case "Оператор":
                    buttonNewRequest.Visible = true;
                    buttonEditRequest.Visible = true;
                    break;

                case "Менеджер":
                    buttonReport.Visible = true;
                    break;
            }
        }

        private void ListRequests_Shown(object sender, EventArgs e)
        {
            LoadRequests();
            ShowRequests();
            LoadComboBoxStatus();
            ChangeButtonsVisibility();
        }

        private void textBoxFindByNumber_TextChanged(object sender, EventArgs e)
        {
            LoadRequests();

            FilterRequestsByStatus();

            FilterRequestsByNumber();
        }

        private void FilterRequestsByNumber()
        {
            if (textBoxFindByNumber.Text.Length == 0)
            {
                ShowRequests();
                return;
            }

            try
            {
                int number = Convert.ToInt32(textBoxFindByNumber.Text);
                // requests = requests.Where(r => r.RequestId.ToString().Contains(number.ToString())).ToList();
                requests = requests.Where(r => r.RequestId.ToString().Contains(number.ToString())).ToList();
                ShowRequests();
            }
            catch (Exception ex)
            {
                MessageBox.Show("Введите число!");
                textBoxFindByNumber.Clear();
            }
        }
        private void FilterRequestsByStatus()
        {
            string status = comboBoxStatus.Text;

            if (status.Equals("Все статусы"))
            {
                ShowRequests();
                return;
            }

            requests = requests.Where(r => r.Status.StatusName.Equals(status)).ToList();
            ShowRequests();
        }

        private void comboBoxStatus_SelectedIndexChanged(object sender, EventArgs e)
        {
            LoadRequests();
            FilterRequestsByNumber();
            FilterRequestsByStatus();
        }

        private void buttonNewRequest_Click(object sender, EventArgs e)
        {
            View.WorkRequest workRequest = new View.WorkRequest(0);
            this.Hide();
            workRequest.ShowDialog();
            this.Show();
        }

        private void buttonEditRequest_Click(object sender, EventArgs e)
        {
            int selectnumber = Convert.ToInt32(gridRequests.CurrentRow.Cells[0].Value);
            View.WorkRequest workRequest = new View.WorkRequest(selectnumber);
            this.Hide();
            workRequest.ShowDialog();
            this.Show();
        }
    }
}
