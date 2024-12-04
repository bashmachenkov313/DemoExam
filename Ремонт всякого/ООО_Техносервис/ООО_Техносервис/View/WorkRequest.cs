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

namespace ООО_Техносервис.View
{
    public partial class WorkRequest : Form
    {
        Model.Request request = null;
        public WorkRequest()
        {
            InitializeComponent();
        }        

        public WorkRequest(int number)
        {
            InitializeComponent();
            if (number != 0) 
            {
                request = Helper.DB.Request.Where(r=>r.RequestId == number).FirstOrDefault();
                MessageBox.Show(request.User1.UserFullName.ToString());
            }
        }

        private void buttonExit_Click(object sender, EventArgs e)
        {
            this.Close();
        }
    }
}
