using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.Web.ASPxScheduler;
using DevExpress.Web.ASPxScheduler.Internal;
using System.Data.OleDb;
using DevExpress.XtraScheduler;

public partial class _Default : System.Web.UI.Page
{
    int lastInsertedAppointmentId;

    protected void ASPxScheduler1_AppointmentRowInserting(object sender, ASPxSchedulerDataInsertingEventArgs e)
    {
        // Autoincremented primary key case
        e.NewValues.Remove("ID");
    }
    protected void ASPxScheduler1_AppointmentRowInserted(object sender, ASPxSchedulerDataInsertedEventArgs e)
    {
        // Autoincremented primary key case
        e.KeyFieldValue = this.lastInsertedAppointmentId;
    }
    protected void AppointmentsDataSource_Inserted(object sender, SqlDataSourceStatusEventArgs e)
    {
        // Autoincremented primary key case
        OleDbConnection connection = (OleDbConnection)e.Command.Connection;
        using (OleDbCommand cmd = new OleDbCommand("SELECT @@IDENTITY", connection))
        {
            this.lastInsertedAppointmentId = (int)cmd.ExecuteScalar();
        }
    }
    protected void ASPxScheduler1_OnAppointmentsInserted(object sender, PersistentObjectsEventArgs e)
    {
        // Autoincremented primary key case
        int count = e.Objects.Count;
        System.Diagnostics.Debug.Assert(count == 1);
        Appointment apt = (Appointment)e.Objects[0];
        ASPxSchedulerStorage storage = (ASPxSchedulerStorage)sender;
        storage.SetAppointmentId(apt, lastInsertedAppointmentId);
    }
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void ASPxPageControl1_TabClick(object source, DevExpress.Web.TabControlCancelEventArgs e)
    {
        if (e.Tab.Text == "Tab1") {
            ASPxScheduler.DataBind();
        }
    }
}

