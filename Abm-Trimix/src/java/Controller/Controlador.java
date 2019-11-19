
package Controller;

import Config.Conexion;
import Entidad.Persona;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class Controlador {
    Conexion con=new Conexion();
    JdbcTemplate jdbcTemplate = new JdbcTemplate(con.Conectar());
    ModelAndView mav = new ModelAndView();
    int id;
    List datos;
    
    
    @RequestMapping("index.htm")
    public ModelAndView Listar(){
        String sql="select * from persona";
        datos = this.jdbcTemplate.queryForList(sql);
        mav.addObject("lista", datos);
        mav.setViewName("index");
        return mav;
        
    }
    @RequestMapping(value ="agregar.htm", method = RequestMethod.GET)
    public ModelAndView Agregar(){
        mav.addObject(new Persona());
        mav.setViewName("agregar");
        return mav;
    }
        @RequestMapping(value ="agregar.htm", method = RequestMethod.POST)
    public ModelAndView Agregar(Persona p){
        String sql="insert into persona(Nombre,Apellido,NroDoc,TipoDoc,FechaNac)values(?,?,?,?,?)";
        this.jdbcTemplate.update(sql,p.getPerNombre(),p.getPerApellido(),p.getPerNumeroDocumeto(),p.getPerTipoDocumento(),p.getPerFechaNacimiento());
        return new ModelAndView("redirect:/index.htm");
    }

    
    @RequestMapping(value ="editar.htm", method = RequestMethod.GET)
    public ModelAndView Editar(HttpServletRequest request){
        id = Integer.parseInt(request.getParameter("id"));
        String sql="select * from persona where Id="+id;
        datos = this.jdbcTemplate.queryForList(sql);
        mav.addObject("lista",datos);
        mav.setViewName("editar");
        return mav;
    }
    
    @RequestMapping(value ="editar.htm", method = RequestMethod.POST)
    public ModelAndView Editar(Persona p){
        String sql ="update persona set Nombre=?,Apellido=?,NroDoc=?,TipoDoc=?,FechaNac=? where id=?";
        this.jdbcTemplate.update(sql,p.getPerNombre(),p.getPerApellido(),p.getPerNumeroDocumeto(),p.getPerTipoDocumento(),p.getPerFechaNacimiento(),id);
        return new ModelAndView("redirect:/index.htm");
    }
    
    
    @RequestMapping(value ="delete.htm")
    public ModelAndView Delete(HttpServletRequest request){
        id=Integer.parseInt(request.getParameter("id"));
        String sql ="delete from persona where Id="+id;
        this.jdbcTemplate.update(sql);
        return new ModelAndView("redirect:/index.htm");
    }
    
        @RequestMapping("buscar.htm")
    public ModelAndView Buscar(String texto){
        List<Persona> lista = new ArrayList<>();
        String sql="select * from persona where Nombre like '%"+texto+"%'";
        datos = this.jdbcTemplate.queryForList(sql);
        mav.addObject("lista", datos);
        mav.setViewName("buscar");
        return mav;
    }
    
    
    
    
      
    
}
