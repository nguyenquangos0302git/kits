/**
 * @author dung
 */
package tp.kits3.comedians.dao;

import tp.kits3.comedians.dto.ReportDTO;

public interface IReportCustomDao extends GenericDao<ReportDTO> {
	ReportDTO reportWeek();
	ReportDTO reportBeforeWeek();
}
