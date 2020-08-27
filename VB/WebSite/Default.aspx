<%@ Page Language="vb" AutoEventWireup="true"  CodeFile="Default.aspx.vb" Inherits="_Default" %>

<%@ Register assembly="DevExpress.Web.ASPxScheduler.v15.2, Version=15.2.20.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxScheduler" tagprefix="dxwschs" %>
<%@ Register assembly="DevExpress.XtraScheduler.v15.2.Core, Version=15.2.20.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.XtraScheduler" tagprefix="dxschsc" %>
<%@ Register assembly="DevExpress.Web.v15.2, Version=15.2.20.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dxwgv" %>
<%@ Register assembly="DevExpress.Web.v15.2, Version=15.2.20.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dxe" %>
<%@ Register assembly="DevExpress.Web.v15.2, Version=15.2.20.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dxp" %>

<%@ Register assembly="DevExpress.Web.v15.2, Version=15.2.20.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dxtc" %>
<%@ Register assembly="DevExpress.Web.v15.2, Version=15.2.20.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dxw" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>

    </div>
    <asp:AccessDataSource ID="AccessDataSource1" runat="server" 
        DataFile="~/App_Data/CarsDB.mdb"         
        SelectCommand="SELECT [ID], [CarId], [Status], [Subject], [Description], [Label], [StartTime], [EndTime], [Location], [AllDay], [EventType], [RecurrenceInfo], [ReminderInfo] FROM [CarScheduling]" 
        DeleteCommand="DELETE FROM [CarScheduling] WHERE [ID] = ?" 
        InsertCommand="INSERT INTO [CarScheduling] ([CarId], [Status], [Subject], [Description], [Label], [StartTime], [EndTime], [Location], [AllDay], [EventType], [RecurrenceInfo], [ReminderInfo]) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)" 
        UpdateCommand="UPDATE [CarScheduling] SET [CarId] = ?, [Status] = ?, [Subject] = ?, [Description] = ?, [Label] = ?, [StartTime] = ?, [EndTime] = ?, [Location] = ?, [AllDay] = ?, [EventType] = ?, [RecurrenceInfo] = ?, [ReminderInfo] = ? WHERE [ID] = ?">
        <DeleteParameters>
            <asp:Parameter Name="ID" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="CarId" Type="Int32" />
            <asp:Parameter Name="Status" Type="Int32" />
            <asp:Parameter Name="Subject" Type="String" />
            <asp:Parameter Name="Description" Type="String" />
            <asp:Parameter Name="Label" Type="Int32" />
            <asp:Parameter Name="StartTime" Type="DateTime" />
            <asp:Parameter Name="EndTime" Type="DateTime" />
            <asp:Parameter Name="Location" Type="String" />
            <asp:Parameter Name="AllDay" Type="Boolean" />
            <asp:Parameter Name="EventType" Type="Int32" />
            <asp:Parameter Name="RecurrenceInfo" Type="String" />
            <asp:Parameter Name="ReminderInfo" Type="String" />
            <asp:Parameter Name="ID" Type="Int32" />
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="CarId" Type="Int32" />
            <asp:Parameter Name="Status" Type="Int32" />
            <asp:Parameter Name="Subject" Type="String" />
            <asp:Parameter Name="Description" Type="String" />
            <asp:Parameter Name="Label" Type="Int32" />
            <asp:Parameter Name="StartTime" Type="DateTime" />
            <asp:Parameter Name="EndTime" Type="DateTime" />
            <asp:Parameter Name="Location" Type="String" />
            <asp:Parameter Name="AllDay" Type="Boolean" />
            <asp:Parameter Name="EventType" Type="Int32" />
            <asp:Parameter Name="RecurrenceInfo" Type="String" />
            <asp:Parameter Name="ReminderInfo" Type="String" />
        </InsertParameters>
    </asp:AccessDataSource>
    <asp:AccessDataSource ID="AccessDataSource2" runat="server"
        DataFile="~/App_Data/CarsDB.mdb"        
        SelectCommand="SELECT [ID], [Model] FROM [Cars]" 
        UpdateCommand="UPDATE [Cars] SET [Model] = ? WHERE [ID] = ?">
        <DeleteParameters>
            <asp:Parameter Name="ID" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="Model" Type="String" />
            <asp:Parameter Name="ID" Type="Int32" />
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="ID" Type="Int32" />
            <asp:Parameter Name="Model" Type="String" />
        </InsertParameters>
    </asp:AccessDataSource>

    <dxtc:ASPxPageControl ID="ASPxPageControl1" runat="server" ActiveTabIndex="0"  EnableCallBacks="true"
        ontabclick="ASPxPageControl1_TabClick">
        <TabPages>
            <dxtc:TabPage Text="Tab0">
                <ContentCollection>
                    <dxw:ContentControl runat="server">
                           <dxwgv:ASPxGridView ID="ASPxGridView1" runat="server" 
                               AutoGenerateColumns="false" 
        DataSourceID="AccessDataSource2" KeyFieldName="ID">      
        <Columns>
            <dxwgv:GridViewCommandColumn VisibleIndex="0" ShowEditButton="true">
            </dxwgv:GridViewCommandColumn>
            <dxwgv:GridViewDataTextColumn FieldName="ID" ReadOnly="True" VisibleIndex="1">
                <EditFormSettings Visible="False" />
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewDataTextColumn FieldName="Model" VisibleIndex="2">
            </dxwgv:GridViewDataTextColumn>
        </Columns>        
    </dxwgv:ASPxGridView>
                    </dxw:ContentControl>
                </ContentCollection>
            </dxtc:TabPage>
            <dxtc:TabPage Text="Tab1">
                <ContentCollection>
                    <dxw:ContentControl runat="server">
                      <dxwschs:ASPxScheduler ID="ASPxScheduler" runat="server"  ClientInstanceName="scheduler"
        AppointmentDataSourceID="AccessDataSource1" GroupType="Resource" 
        ResourceDataSourceID="AccessDataSource2" Start="2009-07-28"
        OnAppointmentRowInserting="ASPxScheduler1_AppointmentRowInserting"
        OnAppointmentRowInserted="ASPxScheduler1_AppointmentRowInserted"
        OnAppointmentsInserted="ASPxScheduler1_OnAppointmentsInserted">
        <Storage>
            <Appointments>
                <Mappings AllDay="AllDay" AppointmentId="ID" Description="Description" 
                    End="EndTime" Label="Label" Location="Location" RecurrenceInfo="RecurrenceInfo" 
                    ReminderInfo="ReminderInfo" ResourceId="CarId" Start="StartTime" 
                    Status="Status" Subject="Subject" Type="EventType" />
            </Appointments>
            <Resources>
                <Mappings Caption="Model" ResourceId="ID" />
            </Resources>
        </Storage>
        <Views>
            <DayView ResourcesPerPage="5">
                <TimeRulers>
                    <dxschsc:TimeRuler>
                    </dxschsc:TimeRuler>
                </TimeRulers>
            </DayView>
            <WorkWeekView>
                <TimeRulers>
                    <dxschsc:TimeRuler>
                    </dxschsc:TimeRuler>
                </TimeRulers>
            </WorkWeekView>
        </Views>
    </dxwschs:ASPxScheduler>
                    </dxw:ContentControl>
                </ContentCollection>
            </dxtc:TabPage>
        </TabPages>
    </dxtc:ASPxPageControl>
    </form>
</body>
</html>