using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text.RegularExpressions;

namespace Pay_Application
{
    public partial class Index : System.Web.UI.Page
    {
        /// page load visibility changes so the pay statement is reset on re render.
        protected void Page_Load(object sender, EventArgs e)
        {
            PanelPayStatement.Visible = false;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (
            Filter_and_Add_Name(FirstNameText, InfoFirstNameLabel) &
            Filter_and_Add_Name(LastNameText, InfoLastNameLabel)&
            Validate_Number(HourlyPayText, InfoHourlyPay) &
            Validate_Number(HoursText, InfoHoursLabel,80))
            {
                Error.Visible = false;
                PayNameText.Text = FirstNameText.Text + " " + LastNameText.Text;
                PayHourlyRateText.Text = HourlyPayText.Text;
                PayTotalHoursWorkedText.Text = HoursText.Text;
                Compensation_Calcs(HoursText, HourlyPayText);
                PanelPayStatement.Visible = true;
            }
            else
            {
                Error.Visible = true;
            }
        }
        /// <summary>
        /// calculates compensation based on pay and 40 hour threshold for Overtime. 24% static tax bracket
        /// is used here. 
        /// Calculates regular pay, overtime pay, taxes, total pay, and total pay after taxes.
        /// </summary>
        /// <param name="hours"></param>
        /// <param name="payRate"></param>
        void Compensation_Calcs(TextBox hours,TextBox payRate)
        {
            decimal dTotalPay;
            decimal dRegularPay;
            decimal dTaxes;
            decimal dTotalHours = Convert.ToDecimal(hours.Text);
            decimal dPayRate = Convert.ToDecimal(payRate.Text);
            if (dTotalHours > 40M)
            {
                decimal dOvertimeHours = dTotalHours - 40M;
                PayOvertimeHoursText.Text = dOvertimeHours.ToString("F");

                decimal dOvertimePay = dOvertimeHours * dPayRate * 1.5M;
                PayOvertimePayText.Text = dOvertimePay.ToString("F");

                dRegularPay = 40M * dPayRate;

                dTotalPay = dRegularPay + dOvertimePay;
            }
            else
            {
                dRegularPay = dTotalHours * dPayRate;
                PayRegularPayText.Text = dRegularPay.ToString("F");
                dTotalPay = dRegularPay;

            }
            PayRegularPayText.Text = dRegularPay.ToString("F");
            PayTotalGrossPayText.Text = dTotalPay.ToString("F");
            dTaxes = dTotalPay * 0.24M;
            PayTaxesText.Text = dTaxes.ToString("F");
            PayNetPayText.Text = (dTotalPay - dTaxes).ToString("F"); 
        }
        /// <summary>
        /// validats number inputs to be greater than 0.
        /// </summary>
        /// <param name="numberData">number text to check</param>
        /// <param name="infoLabelTip">tooltip to adjust if needed with applicable messages</param>
        /// <returns></returns>
        bool Validate_Number(TextBox numberData, Label infoLabelTip, decimal limit = decimal.MaxValue)
        {
            try
            {
                decimal dNumber = Convert.ToDecimal(numberData.Text);

                if (dNumber <= 0M || dNumber>limit)
                {
                    infoLabelTip.Visible = true;
                    infoLabelTip.ToolTip = dNumber <= 0M ? "Please input a value greater than 0." : "Value can not exceed 80";
                    return false;
                }
                numberData.Text = dNumber.ToString("F");
                infoLabelTip.Visible = false;
                return true;
            }
            catch (Exception ex)
            {
                infoLabelTip.Visible = true;
                infoLabelTip.ToolTip = ex.Message + " " + "Please input a numeric value in this field. Decimal values are also accepted.";
                return false;
            }

        }
        /// <summary>
        /// Method to filter the text input leaving only Alphabet characters and hyphens (-) as they can be common in names.
        /// Regex will check to ensure only valid characters are entered.
        /// </summary>
        /// <param name="inputTextData">textbox field to check</param>
        /// <param name="infoLabelTip">label to modify if invalid</param>
        /// <returns></returns>
        bool Filter_and_Add_Name (TextBox inputTextData, Label infoLabelTip)
        {
            string filteredString = Regex.Replace(inputTextData.Text , @"[^A-Za-z\-]", "");
            inputTextData.Text = filteredString.Trim();

            if (filteredString.Trim().Length > 0)
            {
                infoLabelTip.Visible = false;
                return true;
            }
            else
            {
                infoLabelTip.Visible = true;
                infoLabelTip.ToolTip = "Please enter valid English Alphabet Characters. Hyphens are accepted.";
                return false;
            }

        }

        protected void ClearButton_Click(object sender, EventArgs e)
        {
            FirstNameText.Text = String.Empty;
            LastNameText.Text = String.Empty;
            HourlyPayText.Text = String.Empty;
            HoursText.Text = String.Empty;

        }
    }
}