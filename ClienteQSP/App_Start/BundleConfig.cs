﻿using System.Web;
using System.Web.Optimization;

namespace ClienteQSP
{
    public class BundleConfig
    {
        // For more information on bundling, visit https://go.microsoft.com/fwlink/?LinkId=301862
        public static void RegisterBundles(BundleCollection bundles)
        {
            bundles.Add(new ScriptBundle("~/bundles/jquery").Include(
                        "~/Scripts/jquery-{version}.js"));

            bundles.Add(new ScriptBundle("~/bundles/jqueryval").Include(
                        "~/Scripts/jquery.validate*"));

            // Utilice la versión de desarrollo de Modernizr para desarrollar y obtener información. De este modo, estará
            // ready for production, use the build tool at https://modernizr.com to pick only the tests you need.
            bundles.Add(new ScriptBundle("~/bundles/modernizr").Include(
                        "~/Scripts/modernizr-*"));

            bundles.Add(new ScriptBundle("~/bundles/bootstrap").Include(
                      "~/Scripts/popper.min.js",
                      "~/Scripts/bootstrap.js",
                      "~/Scripts/respond.js"));

            bundles.Add(new StyleBundle("~/Content/css").Include(
                      "~/Content/bootstrap.css",
                      "~/Content/site.css",
                      "~/Content/font-awesome.css",
                       "~/Content/mdb.css",
                      "~/Content/style.css",
                      "~/Content/compiled.min.css"));
            // Utilizo bootstrap desing

            bundles.Add(new ScriptBundle("~/bundles/mdb").Include(
                      "~/Scripts/mdb.js",
                      "~/Scripts/bigSlide.js"));

            // Utilizo materialize
            bundles.Add(new StyleBundle("~/Content/materialize").Include(
                      "~/Content/materialize.css",
                      "~/Content/font-awesome.css",
                      "~/Content/material-icons.css"));

            bundles.Add(new ScriptBundle("~/bundles/materializejs").Include(
                      "~/Scripts/materialize.js"));

            // Login view
            bundles.Add(new ScriptBundle("~/bundles/loginval").Include(
                        "~/Scripts/login.js"));
            // home view
            bundles.Add(new ScriptBundle("~/bundles/homejs").Include(
                        "~/Scripts/home.js"));

        }
    }
}
