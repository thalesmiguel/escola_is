class CursoStatus < EnumerateIt::Base
  associate_values(
    inativo: 0,
    ativo: 1
  )
end
