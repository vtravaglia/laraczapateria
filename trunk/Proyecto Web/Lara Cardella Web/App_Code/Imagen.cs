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
/// Descripción breve de Imagen
/// </summary>
public class Imagen
{
    private String pathBig;
    private String pathSmall;

    public Imagen()
    {
    }

    public String PathSmall
    {
        get { return pathSmall; }
        set { pathSmall = value; }
    }

    public String PathBig
    {
        get { return pathBig; }
        set { pathBig = value; }
    }
}
