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
/// Descripción breve de pathImgEmptyException
/// </summary>
public class pathImgEmptyException : System.ApplicationException
{
    public pathImgEmptyException() {}
    public pathImgEmptyException(string message) {}
    public pathImgEmptyException(string message, System.Exception inner) {}
 
    // Constructor needed for serialization 
    // when exception propagates from a remoting server to the client.
    protected pathImgEmptyException(System.Runtime.Serialization.SerializationInfo info,
        System.Runtime.Serialization.StreamingContext context) {}
}
