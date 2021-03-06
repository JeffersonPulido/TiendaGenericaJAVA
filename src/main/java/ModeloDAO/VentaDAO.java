package ModeloDAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.swing.JOptionPane;

import java.util.ArrayList;
import java.util.List;

import Config.Conexion;
import Modelo.Clientes;
import Modelo.DetalleVentaDTO;
import Modelo.ReporteVentaDTO;
import Modelo.VentaDTO;


public class VentaDAO{
	
	Conexion cn = new Conexion();
	Connection conec = cn.conectar();
	PreparedStatement ps = null;
	ResultSet res = null;
	
		//BUSCAR VENTAS
	
	public boolean crearVenta(VentaDTO vDTO, DetalleVentaDTO dvDTO1, DetalleVentaDTO dvDTO2, DetalleVentaDTO dvDTO3) {
		boolean bool = false;
		try {
			String insertar = "INSERT INTO ventas (cedula_usuario, cedula_cliente, valor_venta, ivaventa, total_venta) VALUES (?,?,?,?,?)";
			/*String insertar = "INSERT INTO ventas (cedula_cliente, valor_venta, ivaventa, total_venta) VALUES (?,?,?,?)";*/
			ps = conec.prepareStatement(insertar);
			ps.setString(1, vDTO.getcUsuario());
			ps.setString(2, vDTO.getcCliente());
			ps.setInt(3, vDTO.getValorVenta());
			ps.setInt(4, vDTO.getIvaVenta());
			ps.setInt(5, vDTO.getTotalVenta());
			bool = ps.executeUpdate()>0;
			if(bool) {
				int codigo = consultarCodigoVenta();
				crearDetalleVenta(dvDTO1, codigo);
				crearDetalleVenta(dvDTO2, codigo);
				crearDetalleVenta(dvDTO3, codigo);
			}
		} catch (SQLException sqle) {
			JOptionPane.showMessageDialog(null, "Error al insertar la venta en dao. "+sqle);
		}
		return bool;
	}
	
	public boolean crearDetalleVenta(DetalleVentaDTO dvDTO, int codigoVenta) {
		boolean bool = false;
		try {			
			String insertar = "INSERT INTO detalle_ventas (cantidad_producto, codigo_producto, codigo_venta, valor_total, valor_venta, valoriva) VALUES (?,?,?,?,?,?)";
			ps = conec.prepareStatement(insertar);
			ps.setInt(1, dvDTO.getCantidad());
			ps.setInt(2, dvDTO.getCodigoProducto());
			ps.setInt(3, codigoVenta);
			ps.setInt(4, dvDTO.getValorTotal());
			ps.setInt(5, dvDTO.getValorVenta());
			ps.setInt(6, dvDTO.getValorIva());
			bool = ps.executeUpdate()>0;			
			} catch (Exception sqle) {
			JOptionPane.showMessageDialog(null, "Error al insertar el detalle de venta en dao. "+sqle);
		}
		return bool;
	}
	
	public int consultarCodigoVenta() {
		int codigo=0;
		try {
			String ordenar = "SELECT codigo_venta FROM ventas ORDER BY codigo_venta DESC LIMIT 1;";
			ps = conec.prepareStatement(ordenar);
			res = ps.executeQuery();
			while(res.next()) {
				codigo = res.getInt(1);
			}
		} catch (SQLException e) {
			JOptionPane.showMessageDialog(null, "Error al consultar el codigo en la base de datos. "+e);
		}
		return codigo;
	}
	// reporte
		public ArrayList<ReporteVentaDTO> listarVentaCliente() {

			ReporteVentaDTO report = null;
			ArrayList<ReporteVentaDTO> listar = new ArrayList<>();

			String sql = "SELECT cli.cedula_cliente, cli.nombre_cliente, SUM(ven.total_venta) "
							+ "FROM ventas as ven "
							+ "INNER JOIN clientes as cli "
							+ "ON cli.cedula_cliente = ven.cedula_cliente "
							+ "GROUP BY ven.cedula_cliente";
			try {

				ps = conec.prepareStatement(sql);
				res = ps.executeQuery();

				while(res.next()) {
					report = new ReporteVentaDTO(res.getInt(1), res.getString(2), res.getInt(3));
					listar.add(report);
				}

			} catch (Exception e) {
				System.out.println(e);
			}

			return listar;
		}

	}
			
			
			
			
			