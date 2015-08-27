class Admin::DashboardController < AdminController

  def current_year
    d = Date.today
    return d.strftime('%Y')
  end

  def current_week
    d = Date.today
    return d.strftime("%U")
  end

  def index
    vehiculos_semana = Vehiculo.select("EXTRACT('day' FROM created_at) AS day, COUNT(vehiculos.id) AS cantidad")
                       .group('day').where("EXTRACT('week' FROM created_at) = :week", week: current_week.to_i + 1)
    semanal = Array.new
    vehiculos_semana.each do |read|
      line = Hash.new
      line[:x], line[:y] = read.day, read.cantidad.to_f
      semanal << line
    end

    meses = {
        1 => 'Enero', 2 => 'Febrero', 3 => 'Marzo', 4 => 'Abril',
        5 => 'Mayo', 6 => 'Junio', 7 => 'Julio', 8 => 'Agosto',
        9 => 'Septiembre', 10 => 'Octubre', 11 => 'Noviembre', 12 => 'Diciembre'
    }

    vehiculos_meses = Vehiculo.select("EXTRACT('month' FROM created_at) AS mes, COUNT(vehiculos.id) AS cantidad")
                           .group('mes').where("EXTRACT('year' FROM created_at) = :year", year: current_year.to_i)
    mensual = Array.new
    vehiculos_meses.each do |read|
      line = Hash.new
      line[:x], line[:y] = meses[read.mes.to_i], read.cantidad.to_f
      mensual << line
    end
    @chart_mensual = {
        key: 'Vehiculos',
        values: mensual,
        color: "#FD292B"
    }

    @chart_semanal = {
        key: 'Vehiculos',
        values: semanal,
        color: "#FD292B"
    }

  end
end