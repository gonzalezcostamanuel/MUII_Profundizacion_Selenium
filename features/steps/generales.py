import time

from behave import *
from selenium import webdriver
from selenium.webdriver.chrome.service import Service
from selenium.webdriver.common.by import By
from selenium.webdriver.support.wait import WebDriverWait
from webdriver_manager.chrome import ChromeDriverManager


@given('se ha inicializado el contexto')
def step_impl(context):
    context.web = webdriver.Chrome(service=Service(ChromeDriverManager().install()))
    context.web.get("https://www.saucedemo.com")


@step('se finaliza correctamente la prueba')
def step_impl(context):
    WebDriverWait(context.web, 3)  # Esperamos 3 segundos para no saturar de pruebas
    context.web.close()


@step('se pulsa el boton que tiene por nombre de clase "{boton}"')
def step_impl(context, boton):
    WebDriverWait(context.web, 1)
    btn = context.web.find_element(By.CLASS_NAME, boton)
    WebDriverWait(context.web, 1)
    btn.click()


@step('se pulsa el boton que tiene por nombre de id "{boton}"')
def step_impl(context, boton):
    btn = context.web.find_element(By.ID, boton)
    WebDriverWait(context.web, 1)
    btn.click()


@step('se reenvia a la url "{url}"')
def step_impl(context, url):
    assert context.web.current_url == url, "Se esperaba < "+url+" > pero se ha obtenido < "+context.web.current_url+" >"


@step(u'Wait {sec} sec')
def step_impl(context, sec):
    time.sleep(int(sec))

