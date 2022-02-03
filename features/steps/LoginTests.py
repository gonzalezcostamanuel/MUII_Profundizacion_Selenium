from behave import *
from selenium import webdriver
from selenium.webdriver.chrome.service import Service
from selenium.webdriver.common.by import By
from selenium.webdriver.support.wait import WebDriverWait
from webdriver_manager.chrome import ChromeDriverManager


@when('se lanza el login con "{usuario}" y "{contrasena}"')
def step_impl(context, usuario, contrasena):
    # Buscamos los elementos que nos interesan del formulario de Login
    username = context.web.find_element(By.ID, "user-name")
    password = context.web.find_element(By.ID, "password")
    submit = context.web.find_element(By.ID, "login-button")
    username.send_keys(usuario)
    password.send_keys(contrasena)

    # Clicamos en login
    submit.click()
    WebDriverWait(context.web, 5)


@then('aparece "{elemento}" en pantalla')
def step_impl(context, elemento):
    mensaje_error = context.web.find_element(By.CLASS_NAME, elemento)
    assert mensaje_error.is_displayed()
