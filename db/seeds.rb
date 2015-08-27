# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
user = CreateAdminService.new.call
puts 'CREATED ADMIN USER: ' << user.email
Page.destroy_all
nosotros_content = '<p style="text-align: justify;">Auto Stop es un taller con m&aacute;s de 35 a&ntilde;os de experiencia con el servicio especializadomultimarca, y tenemos el agrado de brindarles la mejor soluci&oacute;n en trabajos de &nbsp;enderezada, pintura y mec&aacute;nica automotriz para veh&iacute;culos y motocicletas con la mejor&nbsp;calidad y el servicio que merecen.</p>

<p style="text-align: justify;">Nuestra misi&oacute;n es ofrecer un servicio profesional basado en un enfoque humano y&nbsp;c&aacute;lido que conduzca a la satisfacci&oacute;n total del cliente.</p>

<p style="text-align: justify;">Somos un taller que mantiene la filosof&iacute;a de atenci&oacute;n y servicio al cliente como&nbsp;prioridad; sin descuidar nuestra responsabilidad con el medio ambiente, y manteniendo&nbsp;precios accesibles.</p>

<p style="text-align: justify;">Nuestra vasta experiencia con diferentes Aseguradoras, clientes particulares y del sector&nbsp;p&uacute;blico avalan nuestra calidad y cumplimiento.</p>

<p>El Taller Auto Stop cuenta con 1.110 mt2 divididos en &aacute;rea de parqueo para clientes,&nbsp;&aacute;rea de administraci&oacute;n, &aacute;rea de mec&aacute;nica, &aacute;rea de enderezada, &aacute;rea de pintura,&nbsp;ordenadas y con su respectiva identificaci&oacute;n.</p>

<p><strong>Marcas de veh&iacute;culos con que trabajamos</strong></p>

<hr />
<p>El Taller Auto Stop brinda servicios multimarca:</p>

<p>AUDI, BMW, MERCEDES BENZ, PEUGEOT, RENAULT, CHEVROLET, NISSAN,&nbsp;MAZDA, FIAT, DAEWOO, SUZUKI, FORD, VOLVO, HYUNDAI, KIA, TOYOTA,&nbsp;MITSUBISHI, SKODA, VOLKSWAGEN, HONDA, &nbsp;LADA, CITROEN, TODAS&nbsp;LAS MARCAS DE PROCEDENCIA CHINA EXISTENTES EN EL MERCADO.</p>

<p>As&iacute; como todas las marcas de MOTOCICLETAS, mantenimiento, reparaci&oacute;n y&nbsp;pintura.</p>

'

servicios_content = '<p><strong>El Taller Auto Stop brinda servicios especiales como son los siguientes agregados:</strong></p>

<hr />
<ul>
	<li>Recepci&oacute;n de veh&iacute;culos S&aacute;bados, Domingos, d&iacute;as feriados y todos los d&iacute;as&nbsp;despu&eacute;s del horario habitual de trabajo.&nbsp;</li>
	<li>Servicio de remolque (wincha) dentro del horario normal y a convenir con el&nbsp;cliente.</li>
	<li>Dinero para servicio de TAXI (4 USD)</li>
	<li>Informaci&oacute;n del estado de las reparaciones v&iacute;a mail/ mensajes/ whatss app/ o&nbsp;telef&oacute;nicamente.</li>
	<li>Contamos con un Sistema inform&aacute;tico para mantener informado al cliente&nbsp;sobre el estado de reparaci&oacute;n de su veh&iacute;culo.&nbsp;</li>
	<li>Contamos tambi&eacute;n con servicio de &nbsp;cafeter&iacute;a y bebidas a disposici&oacute;n de los&nbsp;clientes.</li>
	<li>Transporte de motocicletas.</li>
</ul>

<p>&nbsp;</p>
'

2.times do |t|
  Page.create(layout: t+1)
end
Page.where(layout: 1).first.update_attributes(title: 'Quiénes Somos')
Page.where(layout: 2).first.update_attributes(title: 'Servicios')
Page.where(layout: 1).first.update_attributes(content: nosotros_content)
Page.where(layout: 2).first.update_attributes(content: servicios_content)