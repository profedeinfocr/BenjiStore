using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BenjiStore
{
    public partial class Ventas : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            LlenarGrid();
        }

        protected void LlenarGrid()
        {
            string constr = ConfigurationManager.ConnectionStrings["BenjiStoreConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT Ventas.numero_factura, Cajeros.nombre_cajero, Productos.nombre_producto, Maquinas.id_piso from Ventas inner join Maquinas on Ventas.codigo_maquina = Maquinas.codigo_maquina inner join Cajeros on Ventas.codigo_cajero = Cajeros.codigo_cajero inner join Productos on Ventas.codigo_producto = Productos.codigo_producto"))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter())
                    {
                        cmd.Connection = con;
                        sda.SelectCommand = cmd;
                        using (DataTable dt = new DataTable())
                        {
                            sda.Fill(dt);
                            GridView1.DataSource = dt;
                            GridView1.DataBind();
                        }
                    }
                }
            }
        }


        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void BVender_Click(object sender, EventArgs e)
        {
            ClsVentas.cajero = int.Parse(DropCajero.Text);
            ClsVentas.producto = int.Parse(DropProducto.Text);
            ClsVentas.maquina = int.Parse(DropMaquina.Text);

            String s = System.Configuration.ConfigurationManager.ConnectionStrings["BenjiStoreConnectionString"].ConnectionString;
            SqlConnection conexion = new SqlConnection(s);
            conexion.Open();
            SqlCommand comando = new SqlCommand(" INSERT INTO Ventas(codigo_cajero, codigo_producto, codigo_maquina) VALUES('" + DropCajero.SelectedValue + "', '" + DropProducto.SelectedValue + "', '" + DropMaquina.SelectedValue + "')", conexion);
            comando.ExecuteNonQuery();
            conexion.Close();
            LlenarGrid();

        }
    }
}