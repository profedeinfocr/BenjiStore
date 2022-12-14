<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Ventas.aspx.cs" Inherits="BenjiStore.Ventas" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="CSS/Estilo.css" rel="stylesheet" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <p>
        <br />
    </p>
    <form id="form1" runat="server">
                  <ul>
  <li><a >Profe</a></li>
  <li><a >No</a></li>
  <li><a >Sea</a></li>
  <li><a >Concho</a></li>
  <li style="float:right"><a class="active" href="#about">About</a></li>
</ul>


        <p>
            Seleccione el producto:&nbsp;&nbsp;
            <asp:DropDownList ID="DropProducto" runat="server" DataSourceID="SqlDataSource1" DataTextField="nombre_producto" DataValueField="codigo_producto">
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BenjiStoreConnectionString %>" SelectCommand="SELECT * FROM [Productos]"></asp:SqlDataSource>
        </p>
        <p>
            Seleccione el Cajero:&nbsp;
            <asp:DropDownList ID="DropCajero" runat="server" DataSourceID="SqlDataSource2" DataTextField="nombre_cajero" DataValueField="codigo_cajero">
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:BenjiStoreConnectionString2 %>" SelectCommand="SELECT * FROM [Cajeros]"></asp:SqlDataSource>
&nbsp;&nbsp;&nbsp;
        </p>
        <p>
&nbsp; Seleccione la maquina registradora:
            <asp:DropDownList ID="DropMaquina" runat="server" DataSourceID="SqlDataSource3" DataTextField="codigo_maquina" DataValueField="codigo_maquina">
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:BenjiStoreConnectionString3 %>" SelectCommand="SELECT [codigo_maquina] FROM [Maquinas]"></asp:SqlDataSource>
&nbsp;&nbsp;&nbsp;
        </p>
        <p>
            &nbsp;</p>
        <p>
            <asp:Button ID="BVender" runat="server" OnClick="BVender_Click" Text="Realizar Venta" />
        </p>
        <p>
            &nbsp;</p>
        <p>
            <asp:GridView ID="GridView1" runat="server" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
            </asp:GridView>
        </p>
        <p>
            &nbsp;</p>
        <p>
            &nbsp;</p>
        <p>
            &nbsp;</p>
        <p>
            &nbsp;</p>
        <p>
            &nbsp;</p>
        <div>
        </div>
    </form>
</body>
</html>
