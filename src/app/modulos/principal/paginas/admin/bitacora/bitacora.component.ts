import { Component, ViewChild } from '@angular/core';
import { MatDialog } from '@angular/material/dialog';
import { MatPaginator } from '@angular/material/paginator';
import { MatSort } from '@angular/material/sort';
import { MatTableDataSource } from '@angular/material/table';
import { ApiService } from 'src/app/services/api.service';
import { BitacoraFormComponent } from './elementos/bitacoraform/bitacoraform.component';
import { DetallesBitacoraComponent } from './elementos/bitacoradetalles/bitacoradetalles.component';

import jsPDF from 'jspdf';
import autoTable  from 'jspdf-autotable';

@Component({
  selector: 'app-bitacora',
  templateUrl: './bitacora.component.html',
  styleUrls: ['./bitacora.component.css']
})
export class BitacoraComponent {
  title = 'PlanMant'
  displayedColumns: string[] = ['tunidad','ttiporeporte', 'tcaptura','tunidadnegocios', 'fhfecha','tdescripcion','acciones'];
  dataSource!: MatTableDataSource<any>;

  @ViewChild(MatPaginator) paginator!: MatPaginator;
  @ViewChild(MatSort) sort!: MatSort;

  constructor(public dialog: MatDialog, private api: ApiService){}
  ngOnInit(): void {
    this.getAllBitacora();
  }
  openDialogRegistrar(){
    this.dialog.open(BitacoraFormComponent,{
      width: '30%'
    }).afterClosed().subscribe(val => {
      if (val === 'Guardar') {
        this.getAllBitacora();
      }
    });
  }
    getAllBitacora() {
    this.api.getBitacora()
      .subscribe({
        next: (res) => {
          this.dataSource = new MatTableDataSource(res);
          this.dataSource.paginator = this.paginator;
          this.dataSource.sort = this.sort;
        },
        error: (err) => {
          alert("Error en la obtención de datos")
        }
      })
  }
    editBitacora(row: any) {
    this.dialog.open(BitacoraFormComponent, {
      width: '50%',
      data: row
    }).afterClosed().subscribe(val => {
      if (val === 'Actualizar') {
        this.getAllBitacora();
      }
    })
  }
    deleteBitacora(id: number) {
    this.api.deleteBitacora(id).subscribe({
      next: (res) => {
        alert("Bitacora eliminado!!")
        this.getAllBitacora();
      },
      error: () => {
        alert("Error!!!")
      }
    })
  }
  getBitacoraByid(row: any) {
    this.dialog.open(DetallesBitacoraComponent, {
      width: '50%',
      data: row
    }).afterClosed().subscribe(val => {
      if (val === 'Aceptar') {
        this.getAllBitacora();
      }
    })
  }
    applyFilter(event: Event) {
    const filterValue = (event.target as HTMLInputElement).value;
    this.dataSource.filter = filterValue.trim().toLowerCase();

    if (this.dataSource.paginator) {
      this.dataSource.paginator.firstPage();
    }
  }
  generarPDF(bitacora: any) {
    const doc = new jsPDF();
    //'tunidad','ttiporeporte', 'tcaptura','tunidadnegocios', 'fhfecha','tdescripcion'
    const data = {
      ecodbitacora: bitacora.ecodbitacora,
      tunidad: bitacora.tunidad,
      ttiporeporte: bitacora.ttiporeporte,
      tcaptura: bitacora.tcaptura,
      tunidadnegocios: bitacora.tunidadnegocios,
      fhfecha: bitacora.fhfecha,
      tdescripcion: bitacora.tdescripcion,
    };

    /*const image = new Image();
    image.src = '../../img/LOGO.png';
    doc.addImage('../../img/LOGO.png', 'PNG', 10, 10, 50, 50);*/

    autoTable(doc, {
      head: [['tunidad', 'Unidad de negocio', 'Capturista', 'Descripción', 'Tipo de reporte', 'Fecha']],
      body: [
        [data.tunidad, data.tunidadnegocios, data.tcaptura, data.tdescripcion, data.ttiporeporte, data.fhfecha]

      ],
    })
    /*doc.autoTable({
      head: [['ID', 'Equipo', 'Unidad de negocio', 'Capturista', 'Descripcion', 'Tipo de falla', 'Fecha']],
      body: [[data.id, data.equipo, data.unidadNegocio, data.capturista, data.descripcion, data.tipoFalla, data.fecha]]
    });*/

    // Descargar el PDF
    doc.save(`bitacora-${bitacora.tunidad}.pdf`);
  }
}
