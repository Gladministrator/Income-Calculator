<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="Pay_Application.Index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="Styles/Styles.css" rel="stylesheet" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="main-app-container">
            <h1 style="color: #000080; font-size: 50px; font-weight: bold; font-style: normal; text-transform: none; font-family: Arial, Helvetica, sans-serif;">Pay Calculator</h1>
            <div class="all-inputs-container">
                <div class="individual-input">
                    <asp:Label ID="FirstNameLabel" runat="server" Text="First Name:"></asp:Label>
                    <div>
                        <asp:TextBox ID="FirstNameText" runat="server"></asp:TextBox>
                        <asp:Label ID="InfoFirstNameLabel" runat="server" Text="*" ToolTip="Enter Your First Name" Visible="False" ForeColor="Red"></asp:Label>
                    </div>
                </div>
                <div class="individual-input">
                    <asp:Label ID="LastNameLabel" runat="server" Text="Last Name:"></asp:Label>
                    <div>
                        <asp:TextBox ID="LastNameText" runat="server"></asp:TextBox>
                        <asp:Label ID="InfoLastNameLabel" runat="server" Text="*" ToolTip="Enter Your Last Name" Visible="false" ForeColor="Red"></asp:Label>
                    </div>
                </div>
                <div class="individual-input">
                    <asp:Label ID="HoursLabel" runat="server" Text="Hours Worked:"></asp:Label>
                    <div>
                        <asp:TextBox ID="HoursText" runat="server"></asp:TextBox>
                        <asp:Label ID="InfoHoursLabel" runat="server" Text="*" ToolTip="Enter Hours Worked" Visible="false" ForeColor="Red"></asp:Label>
                    </div>
                </div>
                <div class="individual-input">
                    <asp:Label ID="HourlyPayLabel" runat="server" Text="Hourly Pay:"></asp:Label>
                    <div>
                        <asp:TextBox ID="HourlyPayText" runat="server"></asp:TextBox>
                        <asp:Label ID="InfoHourlyPay" runat="server" Text="*" ToolTip="Enter Hourly Pay" Visible="false" ForeColor="Red"></asp:Label>
                    </div>
                </div>
                <asp:Label ID="Error" runat="server" Text="Please review fields marked with an asterisk * " ForeColor="Black" Font-Size="21px" Visible="false"></asp:Label>
            </div>
            <asp:Button ID="Button1" CssClass="calculate-button" runat="server" Text="Calculate Pay Statement" OnClick="Button1_Click" />
            <asp:Panel ID="PanelPayStatement" runat="server" Visible="false" CssClass="payment-panel">
                <h2>Pay Statement</h2>
                <div>
                    <asp:Label ID="PayNameLabel" runat="server" Text="Name:"></asp:Label>
                    <asp:TextBox ID="PayNameText" runat="server"  ReadOnly="true" Width='280px'></asp:TextBox>
                </div>
                <div>
                    <asp:Label ID="PayTotalHoursWorkedLabel" runat="server" Text="Total Hours Worked:"></asp:Label>
                    <asp:TextBox ID="PayTotalHoursWorkedText" runat="server" ReadOnly="true" Width='280px'></asp:TextBox>
                </div>
                <div>
                    <asp:Label ID="PayHourlyRateLabel" runat="server" Text="Hourly Pay Rate:"></asp:Label>
                    <asp:TextBox ID="PayHourlyRateText" runat="server" ReadOnly="true" Width='280px'></asp:TextBox>
                </div>
                <div>
                    <asp:Label ID="PayOvertimeHoursLabel" runat="server" Text="Overtime Hours:"></asp:Label>
                    <asp:TextBox ID="PayOvertimeHoursText" runat="server" ReadOnly="true" Width="280px">0</asp:TextBox>
                </div>
                <div>
                    <asp:Label ID="PayRegularPayLabel" runat="server" Text="Regular Pay:"></asp:Label>
                    <asp:TextBox ID="PayRegularPayText" runat="server" ReadOnly="true" Width='280px'></asp:TextBox>
                </div>
                <div>
                    <asp:Label ID="PayOvertimePayLabel" runat="server" Text="Overtime Pay:"></asp:Label>
                    <asp:TextBox ID="PayOvertimePayText" runat="server" ReadOnly="true" Width='280px'>0</asp:TextBox>
                </div>
                <div>
                    <asp:Label ID="PayTotalGrossPayLabel" runat="server" Text="Total Gross Pay:"></asp:Label>
                    <asp:TextBox ID="PayTotalGrossPayText" runat="server" ReadOnly="true" Width='280px'>0</asp:TextBox>
                </div>
                <div>
                    <asp:Label ID="PayTaxesLabel" runat="server" Text="Taxes:"></asp:Label>
                    <asp:TextBox ID="PayTaxesText" runat="server" ReadOnly="true" Width='280px'></asp:TextBox>
                </div>
                <div>
                    <asp:Label ID="PayNetPayLabel" runat="server" Text="Net Pay:"></asp:Label>
                    <asp:TextBox ID="PayNetPayText" runat="server" ReadOnly="true" Width="280px"></asp:TextBox>
                </div>
                <asp:Button ID="ClearButton" CssClass="clear-button" runat="server" Text="CLEAR" OnClick="ClearButton_Click" />
            </asp:Panel>
        </div>
    </form>
</body>
</html>
