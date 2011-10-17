using System;
using System.Data;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

/// <summary>
/// Descripción breve de CardellaException
/// </summary>
public class CardellaException : Exception
{

    private String message;
    public CardellaException(String message)
	{
        this.Message = message;
	}

    public String Message
    {
        get { return this.message; }
        set { this.message = value; }
    }
}
