using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ClienteQSP.Controllers
{
    public class AyudaController : Controller
    {
        // GET: Ayuda
        public ActionResult AyudaView()
        {
            return View();
        }

        // GET: Ayuda/Details/5
        public ActionResult Details(int id)
        {
            return View();
        }

        // GET: Ayuda/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Ayuda/Create
        [HttpPost]
        public ActionResult Create(FormCollection collection)
        {
            try
            {
                // TODO: Add insert logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: Ayuda/Edit/5
        public ActionResult Edit(int id)
        {
            return View();
        }

        // POST: Ayuda/Edit/5
        [HttpPost]
        public ActionResult Edit(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add update logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: Ayuda/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: Ayuda/Delete/5
        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add delete logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }
    }
}
