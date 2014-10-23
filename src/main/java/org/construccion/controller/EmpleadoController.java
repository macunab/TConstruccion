package org.construccion.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.validation.Valid;

import org.construccion.models.Categoria;
import org.construccion.models.Producto;
import org.construccion.models.Tag;
import org.construccion.repository.CategoriaRepository;
import org.construccion.repository.ProductoRepository;
import org.construccion.repository.TagRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomCollectionEditor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

@Controller
@RequestMapping
public class EmpleadoController {

	@Autowired
	CategoriaRepository categoriaRepo;

	@Autowired
	TagRepository tagRepo;

	@Autowired
	ProductoRepository productoRepo;

	private static final String APACHE_FOLDER_URL = "/home/foox/Documentos/pictures/";

	// Guardo el id(String) junto a su clase.
	private Map<String, Tag> tagCache;

	@RequestMapping(value = "secure/home_page", method = RequestMethod.GET)
	public String getAdminHomePage() {

		return "secure/empleado/home_admin";
	}

	@RequestMapping(value = "secure/save_producto", method = RequestMethod.GET)
	public String getSaveProducto(Model model) {

		List<Categoria> categorias = categoriaRepo.findAll();
		List<Tag> tags = tagRepo.findAll();

		tagCache = new HashMap<String, Tag>();
		for (Tag tag : tags) {
			tagCache.put(tag.getIdAsString(), tag);
		}

		model.addAttribute("categorias", categorias);
		model.addAttribute("tags", tags);
		model.addAttribute("producto", new Producto());

		return "secure/empleado/add_producto";
	}

	@RequestMapping(value = "secure/save_producto", method = RequestMethod.POST)
	public String postSaveProducto(@RequestParam("categorias[]") String cate,
			@RequestParam("imagen") CommonsMultipartFile imagen,
			@Valid Producto producto, BindingResult result, Model model)
			throws IOException {

		if (result.hasErrors()) {
			List<Categoria> categorias = categoriaRepo.findAll();
			List<Tag> tags = tagRepo.findAll();
			tagCache = new HashMap<String, Tag>();
			for (Tag tag : tags) {
				tagCache.put(tag.getIdAsString(), tag);
			}

			model.addAttribute("categorias", categorias);
			model.addAttribute("tags", tags);
			return "secure/empleado/add_producto";
		} else {

			//Categoria categoria = categoriaRepo.findByNombre(cate);
			//producto.setCategoria(categoria);
			producto.setUrlImage("../pictures/" + imageResolver(imagen));
			producto.setActivo(true);
			productoRepo.save(producto);

			return "redirect:/secure/producto_home/1";
		}
	}

	// Custom initBinder para obtener un multiple select que maneje los id como
	// Strings.
	@InitBinder
	protected void initBinder(WebDataBinder binder) throws Exception {
		binder.registerCustomEditor(List.class, "tags",
				new CustomCollectionEditor(List.class) {
					protected Object convertElement(Object element) {
						if (element instanceof Tag) {
							System.out.println("Convercion de Tag a Tag: "
									+ element);
							return element;
						}
						if (element instanceof String) {
							Tag tag = tagCache.get(element);
							System.out.println("Looking up tag for id "
									+ element + ": " + tag);
							return tag;
						}
						System.out.println("Don't know what to do with: "
								+ element);
						return null;
					}
				});
	}

	// Guarda la imagen en un folder especificado del lado del sevidor.
	private String imageResolver(CommonsMultipartFile imagen)
			throws IOException {

		String filename = "";

		if (imagen.getOriginalFilename() != "") {

			File localFile = new File(APACHE_FOLDER_URL
					+ imagen.getOriginalFilename());

			FileOutputStream os = null;

			try {

				os = new FileOutputStream(localFile);
				os.write(imagen.getBytes());

			} finally {
				if (os != null) {
					try {
						os.close();
					} catch (IOException e) {
						e.printStackTrace();
					}
				}
			}

			filename = localFile.getName();

		} else {

			filename = "Sin_imagen.jpg";
		}

		return filename;
	}

	@RequestMapping(value = "secure/producto_home/{pageNumber}", method = RequestMethod.GET)
	public String getHomeProducto(@PathVariable Integer pageNumber, Model model) {

		PageRequest request = new PageRequest(pageNumber - 1, 5,
				Sort.Direction.DESC, "nombre");

		Page<Producto> page = productoRepo.findAllActive(request);

		int current = page.getNumber() + 1;
		int begin = Math.max(1, current - 5);
		int end = Math.min(begin + 10, page.getTotalPages());

		model.addAttribute("page", page);
		model.addAttribute("beginIndex", begin);
		model.addAttribute("endIndex", end);
		model.addAttribute("currentIndex", current);
		model.addAttribute("productos", page.getContent());

		return "secure/empleado/home_producto";
	}

	/* ELIMINAR PRODUCTO */
	@RequestMapping(value = "secure/delete_producto/{codigo}", method = RequestMethod.GET)
	public String getDeleteProducto(@PathVariable Integer codigo) {

		Producto producto = productoRepo.findOne(codigo);

		producto.setActivo(false);
		productoRepo.save(producto);

		return "redirect:/secure/producto_home/1";

	}

}
