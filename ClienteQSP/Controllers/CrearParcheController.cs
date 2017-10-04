using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ClienteQSP.Controllers
{
    public class CrearParcheController : Controller
    {
        // GET: CrearParche
        public ActionResult CrearParcheView()
        {
            return View();
        }

        // GET: CrearParche/Details/5
        public ActionResult Details(int id)
        {
            return View();
        }

        // GET: CrearParche/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: CrearParche/Create
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

        // GET: CrearParche/Edit/5
        public ActionResult Edit(int id)
        {
            return View();
        }

        // POST: CrearParche/Edit/5
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

        // GET: CrearParche/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: CrearParche/Delete/5
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
