package com.bonsai_gardener.filter;

import java.io.IOException;
import java.util.Set;

import com.bonsai_gardener.util.cookieutil;
import com.bonsai_gardener.util.sessionutil;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebFilter(asyncSupported = true, urlPatterns = "/*")
public class AuthenticationFilter implements Filter {

public static final String ROOT = "/";
    
    // Authentication
    public static final String LOGIN = "/login";
    public static final String REGISTER = "/register";

    // Pages
    public static final String HOME = "/home";
    public static final String DASHBOARD = "/admindashboard";
    public static final String ABOUT_US = "/AboutUs";
    public static final String CONTACT_US = "/contactus";
    public static final String PRODUCT = "/product";
    public static final String USER_PROFILE = "/userprofile";
    public static final String EDIT_PROFILE = "/editProfile";
    public static final String UPDATE_PROFILE = "/UpdateProfileServlet";
    
    // Cart and Order
    public static final String CART_LIST = "/viewCart";
    public static final String ADD_TO_CART = "/AddToCart";
    public static final String CART_SERVLET = "/CartServlet";
    public static final String ORDER_CONFIRMATION_PAGE = "/Orderpageconfirmation";
    public static final String ORDER_SUCCESS = "/orderSuccess";
    public static final String CONFIRM_ORDER = "/ConfirmOrder";
    public static final String PREVIEW_ORDER = "/PreviewOrder";

    // Admin/Management
    public static final String ADD_PRODUCT = "/addproduct";
    public static final String EDIT_PRODUCT = "/EditProductServlet";
    public static final String CUSTOMER_LIST = "/CustomerListServlet";
    public static final String ADDPRODUCTSUCCESS = "/addProductSuccess";

    
    public static final String FOOTER = "/Footer";
    public static final String HEADER = "/header";

    
    public static final String SEARCH = "/search";

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        // No initialization needed
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;
        String uri = req.getRequestURI().replace(req.getContextPath(), "");
        
        if (uri.equals("/logo") || uri.startsWith("/images") || uri.endsWith(".ico")) {
            chain.doFilter(request, response);
            return;
        }


        // Allow public access to static files
        if (uri.endsWith(".css") || uri.endsWith(".js") || uri.endsWith(".png") || uri.endsWith(".jpg")
                || uri.endsWith(".jpeg") || uri.contains("/images/")) {
            chain.doFilter(request, response);
            return;
        }

        // Session role
        String role = (String) sessionutil.getAttribute(req, "role_name");
        boolean isLoggedIn = role != null;

        // Define path sets
        Set<String> publicPaths = Set.of(LOGIN, REGISTER, ROOT, HOME, PRODUCT, ABOUT_US, CONTACT_US, SEARCH,"/logo");
        Set<String> customerPaths = Set.of(
                HOME, ROOT, PRODUCT, ABOUT_US, CONTACT_US, USER_PROFILE, EDIT_PROFILE, UPDATE_PROFILE,
                CART_LIST, ADD_TO_CART, CART_SERVLET, ORDER_CONFIRMATION_PAGE, ORDER_SUCCESS, CONFIRM_ORDER,
                PREVIEW_ORDER, SEARCH,"/logo"
        );
        Set<String> adminPaths = Set.of(DASHBOARD, ADD_PRODUCT, EDIT_PRODUCT, CUSTOMER_LIST,ADDPRODUCTSUCCESS);
        
        System.out.println("🔍 URI = " + uri);
        System.out.println("👤 role_name from session = " + role);


        if (!isLoggedIn) {
            // Unauthenticated user
            if (publicPaths.contains(uri)) {
                chain.doFilter(request, response);
            } else {
                res.sendRedirect(req.getContextPath() + LOGIN);
                System.out.println(" Not logged in: Redirected to login.");
            }
        } else if ("admin".equals(role)) {
            // Admin
            if (adminPaths.contains(uri) || publicPaths.contains(uri)) {
                chain.doFilter(request, response);
            } else {
                res.sendRedirect(req.getContextPath() + DASHBOARD);
                System.out.println(" Admin redirected to dashboard.");
            }
        } else if ("customer".equals(role)) {
            // Customer
            if (customerPaths.contains(uri) || publicPaths.contains(uri)) {
                chain.doFilter(request, response);
            } else if (adminPaths.contains(uri)) {
                sessionutil.setAttribute(req, "errorMessage", "Access denied: Admins only.");
                res.sendRedirect(req.getContextPath() + HOME);
                System.out.println(" Customer tried accessing admin page.");
            } else {
                res.sendRedirect(req.getContextPath() + HOME);
                System.out.println(" Customer: Access denied to " + uri);
            }
        }
    }

    @Override
    public void destroy() {
        // No cleanup needed
    }
}
