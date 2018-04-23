Imports Microsoft.VisualBasic
Imports System
Imports System.Collections.Generic
Imports System.Linq
Imports System.Web
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports DevExpress.Web.ASPxScheduler
Imports DevExpress.Web.ASPxScheduler.Internal
Imports System.Data.OleDb
Imports DevExpress.XtraScheduler

Partial Public Class _Default
	Inherits System.Web.UI.Page
	Private lastInsertedAppointmentId As Integer

	Protected Sub ASPxScheduler1_AppointmentRowInserting(ByVal sender As Object, ByVal e As ASPxSchedulerDataInsertingEventArgs)
		' Autoincremented primary key case
		e.NewValues.Remove("ID")
	End Sub
	Protected Sub ASPxScheduler1_AppointmentRowInserted(ByVal sender As Object, ByVal e As ASPxSchedulerDataInsertedEventArgs)
		' Autoincremented primary key case
		e.KeyFieldValue = Me.lastInsertedAppointmentId
	End Sub
	Protected Sub AppointmentsDataSource_Inserted(ByVal sender As Object, ByVal e As SqlDataSourceStatusEventArgs)
		' Autoincremented primary key case
		Dim connection As OleDbConnection = CType(e.Command.Connection, OleDbConnection)
		Using cmd As New OleDbCommand("SELECT @@IDENTITY", connection)
			Me.lastInsertedAppointmentId = CInt(Fix(cmd.ExecuteScalar()))
		End Using
	End Sub
	Protected Sub ASPxScheduler1_OnAppointmentsInserted(ByVal sender As Object, ByVal e As PersistentObjectsEventArgs)
		' Autoincremented primary key case
		Dim count As Integer = e.Objects.Count
		System.Diagnostics.Debug.Assert(count = 1)
		Dim apt As Appointment = CType(e.Objects(0), Appointment)
		Dim storage As ASPxSchedulerStorage = CType(sender, ASPxSchedulerStorage)
		storage.SetAppointmentId(apt, lastInsertedAppointmentId)
	End Sub
	Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs)

	End Sub

	Protected Sub ASPxPageControl1_TabClick(ByVal source As Object, ByVal e As DevExpress.Web.ASPxTabControl.TabControlCancelEventArgs)
		If e.Tab.Text = "Tab1" Then
			ASPxScheduler.DataBind()
		End If
	End Sub
End Class

